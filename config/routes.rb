ICanHazSandvich::Application.routes.draw do

  root to: 'items#index'

  resources :items, except: [:destroy]

  resources :players do
    member do
      get 'hide'
    end
  end

end
