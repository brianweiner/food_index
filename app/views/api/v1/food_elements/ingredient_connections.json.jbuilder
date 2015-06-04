json.foodElementConnections do
  json.array! @connections do |connection|
    json.name connection.secondary_food_element.name.capitalize
    json.foodElementId connection.secondary_food_element_id
    json.connectionType connection.connection_type
    json.foodElementType connection.secondary_food_element.type
  end
end