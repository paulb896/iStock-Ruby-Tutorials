module pauls_cool_gem
  class UserAvailability
    attr_reader :availablitity
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
