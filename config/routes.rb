Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'welcome/index'
  root 'welcome#index'

  resources :currencies do
  end

end
