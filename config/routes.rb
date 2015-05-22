Ichabod::Application.routes.draw do
  resources :collections

  resources :nyucores

  root :to => "catalog#index"
  Blacklight.add_routes(self)

  get 'collections', :to => "collections#index"
  get 'login', :to => 'user_sessions#new', :as => :login
  get 'logout', :to => 'user_sessions#destroy', :as => :logout
  get 'validate', :to => 'user_sessions#validate', :as => :validate
  resources :user_sessions
 
end
