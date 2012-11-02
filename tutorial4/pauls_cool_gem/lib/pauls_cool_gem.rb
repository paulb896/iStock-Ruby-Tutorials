require "date"
module PaulsCoolGem
  class AvailableDate
    attr_accessor :start_date, :end_date
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
    end
    def duration_in_hours
      return ((@start_date - @end_date) * 24).abs.to_i
    end
  end

  class BookedDate < AvailableDate
    STATUS_PENDING = "Pending"
    STATUS_APPROVED = "Approved"
    STATUS_DECLINED = "Declined"
    attr_accessor :status

    def make_pending
      @status = STATUS_PENDING
      return self
    end
    def make_approved
      @status = STATUS_APPROVED
      return self
    end
  end

  class UserAvailability
    attr_reader :availability, :user
    def initialize(user)
      @user = user
      @availability = Array.new
      @bookedTime = Array.new
    end
    def make_available(start_date, end_date)
      if self.is_available?(start_date, end_date)
        @availability.push(AvailableDate.new(start_date, end_date))
      end
      return self
    end
    def is_available?(start_date, end_date)
      @availability.each do |date|
        if ((start_date <= date.end_date) && (end_date >= date.start_date))
          return false
        end
      end
      return true
    end
    def is_available_to_book?(start_date, end_date)
      if self.is_available?(start_date, end_date)
        return false
      end

      @bookedTime.each do |date|
        if (((start_date <= date.end_date) && (end_date >= date.start_date)))
          return false
        end
      end
      return true
    end
    def request_time(user, start_date, end_date)
      if self.is_available_to_book?(start_date, end_date)
        new_booking = BookedDate.new(start_date, end_date)
        new_booking.make_pending
        @bookedTime.push(new_booking)
        return new_booking.status
      else
        return BookedDate::STATUS_DECLINED
      end
    end
  end
end
