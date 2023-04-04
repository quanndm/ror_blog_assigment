Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments
  end
  # get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
