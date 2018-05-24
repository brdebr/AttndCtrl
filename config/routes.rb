Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#main'
  get 'dashboard', to: "home#dashboard"
  # LTI launch (responds to get and post)
  match 'launch', to: "home#launch", via: [:get, :post], as: :lti_launch
end
