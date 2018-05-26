Rails.application.routes.draw do
  devise_for :admins
  root 'home#main'

  # Admins need to create a ToolConsumer object to authenticate the launch with the generated key/secret
  resources :tool_consumers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: "home#dashboard"
  # LTI launch (responds to get and post)
  match 'launch', to: "home#launch", via: [:get, :post], as: :lti_launch
end
