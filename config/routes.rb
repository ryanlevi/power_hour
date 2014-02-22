PowerHour::Application.routes.draw do
  get "home/index"
  get 'playlist', to: 'home#show'

  root 'home#index'

end
