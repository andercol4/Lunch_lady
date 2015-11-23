require 'pry'
class Food
 attr_accessor :food, :item_number, :price

 def initialize(item_number, food, price)
   @item_number = item_number
   @food = food
   @price = price
 end
end

steak = Food.new(1, "Steak", 5.75)
burger = Food.new(2, "Burger", 4.99)
chicken = Food.new(3, "Chicken", 3.14)
fries = Food.new(1, "Fries", 1.32)
salad = Food.new(2, "Salad", 2.19)
soup = Food.new(3, "Soup", 1.99)

main_arr = [steak, burger, chicken]

side_arr = [fries, salad, soup]
# menu = {main_dish: {steak: ["Steak", 5.75], burger: ["Burger", 4.00], chicken: ["Chicken", 50.50]},
#         side_dish: {potatoes: ["Potatoes", 2.25], fries: ["Fries", 1.50], salad: ["Salad", 2.00], soup: ["Soup", 1.00]}
#       }

@choice = []
@total = []

def main_menu(main_arr)
  puts "Your Main dish choices are"
  puts "#{main_arr[0].item_number}) #{main_arr[0].food} is #{main_arr[0].price}"
  puts "#{main_arr[1].item_number}) #{main_arr[1].food} is #{main_arr[1].price}"
  puts "#{main_arr[2].item_number}) #{main_arr[2].food} is #{main_arr[2].price}"
  puts "Choose your main dish's number"
  case gets.to_i
  when 1
    your_choice = main_arr[0]
  when 2
    your_choice = main_arr[1]
  when 3
    your_choice = main_arr[2]
  else
    puts "Invalid choice"
    your_main_choice(main_menu(main_arr))
  end
  puts "You chose #{your_choice.food}"
  @choice << your_choice.food
  @total << your_choice.price
  your_choice
end

def side_menu(side_arr)
  side_arr.each {|item| puts "#{item.item_number}) #{item.food} is #{item.price}"}
  puts "Choose your side dish's number"
  case gets.to_i
  when 1
    your_choice = side_arr[0]
  when 2
    your_choice = side_arr[1]
  when 3
    your_choice = side_arr[2]
  else
    puts "invalid choice"
    your_choice(side_menu(side_arr))
  end
  puts "You chose #{your_choice.food}"
  @choice << your_choice.food
  @total << your_choice.price
  puts @choice
end

def clear_choices
your
end

def total
  sum = 0
  @total.each {|price| sum += price}
  puts "You chose"
  @choice.each {|item| puts "#{item},"}
  puts "for your meal and your total is"
  puts "---------"
  puts sum
end


def operation
  main_menu(main_arr)
  side_menu(side_arr)
  while true
    side_menu(side_arr)
    puts @total
    puts "Would you like more sides? type 'no' for your total now."
    break if gets.strip.downcase == 'no'
  end
  total
end
