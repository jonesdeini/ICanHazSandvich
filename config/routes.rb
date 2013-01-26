ICanHazSandvich::Application.routes.draw do

  get "home/index"
  get "home/resume"

  match '/auth/:provider/callback' => 'session#create'

  root to: "home#index"

  resources :sessions

  resources :items, except: [:destroy]

  resources :players do
    member do
      get 'hide'
      get 'traded'
    end
  end

  resources :searches, except: [:destroy, :update]

end
