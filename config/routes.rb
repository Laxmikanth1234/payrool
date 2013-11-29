Payrolles::Application.routes.draw do
  resources :payrolls
  resources :salaries
  resources :users
  resources :sessions
  resources :employes do
    resources :salaries
    resources :payrolls
  end

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "employes#index"
  

end
