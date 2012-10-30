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
  class UserAvailability
    attr_reader :availability
    def initialize(user)
      @user = user
      @availability = Array.new
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
  end
end
