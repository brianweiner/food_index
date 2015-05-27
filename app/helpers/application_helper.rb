module ApplicationHelper

  def connection_type_list
    ['Moderate', 'Strong', 'Ideal']
  end
  
  def food_element_type_list
    ['Vegetable', 'Fruit', 'Poultry', 'Beef', 'Pork', 'Shellfish', 'Fish', 'Lamb', 'Spice', 'Herb',  'Grain', 'Starch', 'Legume', 'Nut', 'Aromatic', 'Mushroom', 'Dairy', 'Technique', 'Dish', 'Cuisine']
  end

  def indefinite_article word
    %w(a e i o u).include?(word[0].downcase) ? "an #{word}" : "a #{word}"
  end

end
