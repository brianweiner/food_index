module ApplicationHelper

  def connection_type_list
    ['Moderate', 'Strong', 'Ideal']
  end

  def ingredient_connection_link(primary_ingredient, secondary_ingredient, connections)
    connection = connections.where(secondary_ingredient_id: secondary_ingredient.id, primary_ingredient_id: primary_ingredient.id).first
    case connection.connection_type.downcase
    when "ideal"
      string = link_to "<strong>#{secondary_ingredient.name.upcase}</strong>".html_safe, ingredient_path(secondary_ingredient)
    when "strong"
      string = link_to "<strong>#{secondary_ingredient.name}</strong>".html_safe, ingredient_path(secondary_ingredient)
    when "moderate"
      string = link_to secondary_ingredient.name, ingredient_path(secondary_ingredient)
    else
      ""
    end
  end
end
