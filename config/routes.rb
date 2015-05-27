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

  scope :api do
    scope :v1 do
      devise_for :users, :controllers => {:registrations => "api/v1/registrations", :sessions => "api/v1/sessions"}
    end
  end

end
