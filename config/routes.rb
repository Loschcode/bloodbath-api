Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'home/index'
  root 'home#index'

  resource :connect, controller: 'connect' do
    post :anonymous
  end

  resource :coins, controller: 'coins' do
    get :top
  end
  
  resources :coins do
  end

end
