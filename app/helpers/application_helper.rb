module ApplicationHelper

  def connection_type_list
    ['Moderate', 'Strong', 'Ideal']
  end

  def food_element_connection_link(primary_food_element, secondary_food_element, connections)
    connection = connections.where(secondary_food_element_id: secondary_food_element.id, primary_food_element_id: primary_food_element.id).first
    case connection.connection_type.downcase
    when "ideal"
      string = link_to "<strong>#{secondary_food_element.name.upcase}</strong>".html_safe, food_element_path(secondary_food_element)
    when "strong"
      string = link_to "<strong>#{secondary_food_element.name}</strong>".html_safe, food_element_path(secondary_food_element)
    when "moderate"
      string = link_to secondary_food_element.name, food_element_path(secondary_food_element)
    else
      ""
    end
  end
end
