Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:new, :create, :index] do
    collection do
      get "login", to: "users#login"
      post "login", to: "users#authentication"
      get "logout", to: "users#logout"
    end
  end
end
