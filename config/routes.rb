ICanHazSandvich::Application.routes.draw do

  get "home/index"
  get "home/resume"

  root to: "home#index"

  resources :items, except: [:destroy]

  resources :players do
    member do
      get 'hide'
      get 'search'
      get 'traded'
    end
  end

  resources :searches, except: [:destroy, :update]

  match '/auth/:provider/callback' => 'sessions#create'
  match "/login"  => "sessions#new", :as => :login
  match "/logout" => "sessions#destroy", :as => :logout

  resources :users
end
