Rails.application.routes.draw do
  root 'diets#index'
  resources :ingredients 
  resources :meals do
  get :autocomplete_ingredients_name, :on => :collection
  end
  
end
