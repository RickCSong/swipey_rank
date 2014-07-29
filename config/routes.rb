Rails.application.routes.draw do
  resources :games

  root 'ranking#index'
end
