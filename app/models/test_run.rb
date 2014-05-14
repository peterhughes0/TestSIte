class TestRun < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    release_number :string
    timestamps
  end
  attr_accessible :release_number, :tests
  
  has_many :projects
  has_many :test_groups
  has_many :tests, :through => :test_groups

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
