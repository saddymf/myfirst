Rails.application.routes.draw do
  resources :lists
  get 'lists/new'
 # get 'home#index'
  root 'home#dirlist'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
