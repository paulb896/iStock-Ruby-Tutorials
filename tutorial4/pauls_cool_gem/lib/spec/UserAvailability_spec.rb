require 'spec_helper'

describe PaulsCoolGem::UserAvailability do
  before :all do
    @scheduler = PaulsCoolGem::UserAvailability.new("Test User")
    @start_datetime = DateTime.new(2012, 10, 31, 9)
    @end_datetime = DateTime.new(2012, 10, 31, 11)
    @scheduler.make_available(@start_datetime, @end_datetime)
  end

  describe "#request_time" do
    it "returns booking request status of pending when requesting an available date" do
      @scheduler.request_time("Test User", @start_datetime, @end_datetime).should eq('Pending')

    end

    it "returns booking request status of pending when requesting a non-available date" do
      invalid_start = @start_datetime >> 2
      invalid_end = @end_datetime >> 2
      @scheduler.request_time("Test User", invalid_start, invalid_end).should eq('Declined')
    end
  end

  describe "#is_available?" do
    it "returns false when user time is not available" do
      @scheduler.is_available?(@start_datetime, @end_datetime).should eq(false)
    end

    it "returns true when user time is available" do
      available_start = @start_datetime >> 2
      available_end = @end_datetime >> 2
      @scheduler.is_available?(available_start, available_end).should eq(true)
    end
  end
end
