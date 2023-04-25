Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #  root "users#index"
  root "recipes#my_recipes"
  get 'my-recipes', to: 'recipes#my_recipes'
  resources :recipes
end
