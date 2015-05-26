Rails.application.routes.draw do

  root 'pages#index'

  resources :food_elements do
    get :autocomplete_food_element_name, :on => :collection
    post 'search' => "food_elements#search", :on => :collection
  end

  resources :food_element_connections

  FoodElement.subclasses.each do |klass|
    k = klass.name.pluralize.underscore.to_sym
    resources k, :controller => 'food_elements'
  end
end
