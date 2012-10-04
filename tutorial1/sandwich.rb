class Sandwich
  def initialize
    @ingredients = Hash.new
  end
  def required_ingredients
    return ["bread", "meat", "vegetable", "condiment"]
  end
  attr_accessor :ingredients
end
