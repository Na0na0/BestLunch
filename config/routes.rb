Rails.application.routes.draw do
  resources :surveys
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "surveys#new"

  resources :voters, only: [:edit], param: :token
end
