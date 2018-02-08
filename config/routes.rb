require 'sidekiq/web'

Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  mount Sidekiq::Web => '/sidekiq'

  resource :connect, controller: 'connect' do
    post :anonymous
    post :register
    post :authenticate
  end

  resources :base_currencies do
  end

  resource :user, controller: 'user' do
  end

  resource :user_setting, controller: 'user_setting' do
  end

  resource :coins, controller: 'coins' do
    get :top
    get :search
    get :favorite
  end

  resources :coins do
  end

  resource :user_portfolio, controller: 'user_portfolio' do
  end

  resources :portfolio_coins do
  end

  resources :user_market_coins do
  end

end
