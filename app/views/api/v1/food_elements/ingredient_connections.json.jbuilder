json.food_element_connections do
  json.array! @connections do |connection|
    json.name connection.secondary_food_element.name.capitalize
    json.food_element_id connection.secondary_food_element_id
    json.connection_type connection.connection_type
    json.food_element_type connection.secondary_food_element.type
  end
end