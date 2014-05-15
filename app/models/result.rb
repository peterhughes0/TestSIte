class Result < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    outcome :string, :name => true
    timestamps
  end
  attr_accessible :outcome, :test_id, :test_run_id, :test, :test_run, :untested, :passed, :failed
  belongs_to :test
  belongs_to :test_run, :dependent => :destroy

  
  lifecycle do
  state :untested, :default => true
  state :passed
  state :failed
  
   transition :pass, { :untested => :passed }, :available_to => "User.administrator"
   transition :fail, { :untested => :failed }, :available_to => "User.administrator"  
  
  end
  
  
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    true
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
