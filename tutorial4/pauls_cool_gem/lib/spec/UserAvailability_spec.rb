require 'spec_helper'

describe PaulsCoolGem::UserAvailability do
  before :all do
    @scheduler = PaulsCoolGem::UserAvailability.new("Test User")
    @start_datetime = DateTime.new(2012, 10, 31, 9)
    @end_datetime = DateTime.new(2012, 10, 31, 11)
    @scheduler.make_available(@start_datetime, @end_datetime)
  end

  describe "#request_time" do
    it "returns booking request status" do
      @scheduler.request_time("Test User", @start_datetime, @end_datetime).should eq('Pending')

      invalid_start = @start_datetime >> 2
      invalid_end = @end_datetime >> 2
      @scheduler.request_time("Test User", invalid_start, invalid_end).should eq('Declined')
    end
  end
end
