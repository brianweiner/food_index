json.food_element_connections do
  json.array! @connections do |connection|
    json.name connection.secondary_food_element.name
    json.food_element_id connection.secondary_food_element_id
    json.connection_type connection.connection_type
  end
end