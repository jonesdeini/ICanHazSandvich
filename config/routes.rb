ICanHazSandvich::Application.routes.draw do
  resources :players

  root :to => 'players#index'

  # See how all your routes lay out with "rake routes"
end
