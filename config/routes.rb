Rails.application.routes.draw do

  resources :ingredients do
    get :autocomplete_ingredient_name, :on => :collection
  end
end
