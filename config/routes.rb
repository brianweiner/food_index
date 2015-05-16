Rails.application.routes.draw do

  resources :food_elements do
    get :autocomplete_food_element_name, :on => :collection
  end
end
