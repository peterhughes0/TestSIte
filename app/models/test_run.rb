class TestRun < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    release_number :string, :name => true
    timestamps
  end
  attr_accessible :release_number, :tests, :results, :results_outcome
  
  belongs_to :project
  has_many :test_groups
  has_many :tests, :through => :results
  has_many :results, :dependent => :destroy

  
  before_create :addTests
  after_save :addResults
  
  def addTests
  self.tests = self.project.tests
  
  end
  
  def addResults
  self.project.tests(:all).collect do |i|
  @result = Result.new( :test_id => i.id, :test_run_id => self.id )
  #puts @result.test
  #puts @result.test_run 
  @result.save
  end
  end
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
