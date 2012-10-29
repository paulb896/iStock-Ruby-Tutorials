module pauls_cool_gem
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
end
