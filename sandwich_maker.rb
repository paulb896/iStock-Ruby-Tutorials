class Sandwich_Maker
  def request_order
    require_relative "sandwich.rb"
    @customer_sandwich = Sandwich.new
    @customer_sandwich.required_ingredients.each do |ingredient|
      puts "What type of #{ingredient} would you like?"
      STDOUT.flush
      @customer_sandwich.ingredients[ingredient.to_s] = gets.chomp
    end
  end
  def make_sandwich
    puts "I will attempt to make the sandwich now... "
    @customer_sandwich.ingredients.each_pair do |type, ingredient|
      puts "Adding #{ingredient} (#{type}) to your sandwich"
    end
    puts "Your sandwich is complete! That will be an outragous $20"
  end
end
