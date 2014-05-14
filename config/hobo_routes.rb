# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

TestSite::Application.routes.draw do


  # Resource routes for controller projects
  resources :projects


  # Resource routes for controller tests
  resources :tests, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller tests
  resources :test_groups, :as => :test_group, :only => [] do
    resources :tests, :only => [] do
      get '/', :on => :new, :action => 'new_for_test_group'
      collection do
        post '/', :action => 'create_for_test_group'
      end
    end
  end


  # Resource routes for controller test_groups
  resources :test_groups, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller test_groups
  resources :projects, :as => :project, :only => [] do
    resources :test_groups, :only => [] do
      get '/', :on => :new, :action => 'new_for_project'
      collection do
        post '/', :action => 'create_for_project'
      end
    end
  end


  # Resource routes for controller test_runs
  resources :test_runs


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'activate', :action => 'do_activate'
      get 'activate'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  post 'login(.:format)' => 'users#login', :as => 'user_login_post'
  get 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  get 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'
  post 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password_post'

  namespace :concerns do

  end

end
