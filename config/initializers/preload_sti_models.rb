if Rails.env.development?
  # Make sure we preload the parent and children class in development
  # since classes aren't pre-cached. Otherwise we get an error when 
  # accessing a child class before we access the parent.
    require_dependency File.join("app","models","food_element.rb")
  FOOD_ELEMENT_TYPE_LIST.each do |c|
    require_dependency File.join("app","models","food_elements","#{c.downcase}.rb")
  end
end