Rails.application.routes.draw do
  resources :lti_contexts
  resources :lti_users
  devise_for :admins
  root 'home#main'

  # Admins need to create a ToolConsumer object to authenticate the launch with the generated key/secret
  resources :tool_consumers do
    resources :timetables, controller: 'tool_consumers/timetables', shallow: true
  end

  resources :timetable, only: :show do
    resources :timetable_units, shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: "home#dashboard"
  # LTI launch (responds to get and post)
  match 'launch', to: "lti#launch", via: [:get, :post], as: :lti_launch
end
