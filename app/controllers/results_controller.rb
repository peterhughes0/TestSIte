class ResultsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  
  def do_pass
	do_transition_action :pass do
	redirect_to root_url 
	end
	end

	
	  def do_fail
	do_transition_action :fail do
	redirect_to root_url 
	end
	end
	
end
