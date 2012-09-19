ICanHazSandvich::Application.routes.draw do

  root to: 'items#index'

  resources :items, except: [:destroy]

  resources :players

end
