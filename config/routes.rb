Payrolles::Application.routes.draw do
  resources :time_sheets do
    member do
      get 'get_submit'
      post 'do_submit'
      
    end
    collection do
      get 'manage_time_sheets'
      post 'change_status'
    end
  end


  get "password_resets/new"

  resources :payrolls do
    collection do
      get 'generate_payroll'
      get 'get_timesheet_dets'
    end
  end
  resources :salaries
  devise_for :users,  :controllers => { :registrations => "users/Registrations" }
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
    delete 'logout' => 'devise/sessions#destroy'
  end
  root :to => "employes#index"
  resources :holidays
  resources :leaves do
    member do
      put 'approve_leave'
      get 'approve_leave'
    end
    collection do
      get 'leave_history'
      get 'leave_to_approve'
    end
  end
  resources :employes
  resources :users do
    resources :salaries
    resources :payrolls do
      collection do
        get 'work_days'
      end
    end
  end
  resources :password_resets
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "employes#index"
  

end
