class TestsController < ApplicationController

  hobo_model_controller

   auto_actions :all, :except => :index
  
  auto_actions_for :test_group, [:new, :create]

end
