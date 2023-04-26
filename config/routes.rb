Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #  root "users#index"
  root "recipes#my_recipes"
  get 'public-recipes', to: 'recipes#public_recipes'
  get 'my-recipes', to: 'recipes#my_recipes'
  get 'my-foods', to: 'foods#my_foods'
  resources :recipes do
    resources :recipe_foods
  end  
  resources :foods
end
