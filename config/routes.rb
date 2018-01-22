Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'home/index'
  root 'home#index'

  resource :connect, controller: 'connect' do
    post :anonymous
  end

  resource :user, controller: 'user' do
  end

  resource :coins, controller: 'coins' do
    get :top
    get :search
    get :favorite
  end

  resources :user_market_coins, controller: 'user_market_coins' do
  end

  resources :coins do
  end

end
