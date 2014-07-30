Rails.application.routes.draw do
  scope format: true, constraints: { :format => 'json' } do
    resources :games, only: [:create, :show]
    resources :rankings, only: [:index]
  end

  root 'static#index'

  match '/*path' => 'static#index', via: [:get, :post, :put, :patch, :delete]
end
