Rails.application.routes.draw do
  resources :lists do
  collection do
    get :filtered_index
  end
end
  get 'lists/new'
 # get 'home#index'
  root 'home#dirlist'
  #get 'lists/below30'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
