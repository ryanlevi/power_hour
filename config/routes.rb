PowerHour::Application.routes.draw do
  get "home/index"
  get 'playlist', to: 'home#show'
  get 'about', to: 'home#about'
  get 'random', to: 'home#random'
  get 'settings', to: 'home#settings'

  root 'home#index'

end
