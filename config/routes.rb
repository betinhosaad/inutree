Rails.application.routes.draw do
  root 'diets#index'
  resources :ingredients do     
    get :autocomplete_ingredient_name, :on => :collection
  end
  resources :meals
  
end
