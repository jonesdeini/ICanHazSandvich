ICanHazSandvich::Application.routes.draw do

  resources :searches, except: [:destroy, :update]

  get "home/index"

  root to: "home#index"

  resources :items, except: [:destroy]

  resources :players do
    member do
      get 'hide'
      get 'traded'
    end
  end

end
