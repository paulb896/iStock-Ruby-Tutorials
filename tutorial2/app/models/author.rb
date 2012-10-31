class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  has_many :articles
  def availability
    if !defined? @scheduler
      self.loadSchedulerWithTestData
    end
    return @scheduler.availability
  end
  def loadSchedulerWithTestData
    @scheduler = PaulsCoolGem::UserAvailability.new(self.id)
    startDate = DateTime.new(2012, 12, 21, 7)
    endDate = DateTime.new(2012, 12, 21, 16)
    @scheduler.make_available(startDate, endDate)
  end
end
