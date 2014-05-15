class Test < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :text
	prerequisites	:text
	steps		:text
	input		:text
	expected_result	:text
	actual_result	:text
	status		:boolean
	comments	:text
    timestamps
  end
  attr_accessible :name, :description, :prerequisites, :steps, :input, :expected_result, :actual_result, :status, :comments, :project, :results
  
  belongs_to :project
  belongs_to :test_group
  has_many :test_runs, :through => :results
  has_many :results

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
