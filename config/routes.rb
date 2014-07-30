Rails.application.routes.draw do
  resources :games, only: [:create, :show]

  scope format: true, constraints: { :format => 'json' } do
    resources :rankings, only: [:index]
  end

  root 'static#index'

  match '/*path' => 'static#index', via: [:get, :post, :put, :patch, :delete]
end
