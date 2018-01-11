Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'welcome/index'
  root 'welcome#index'

  resource :connect, controller: 'connect' do
    post :anonymous
  end

  resources :coins do
  end

end
