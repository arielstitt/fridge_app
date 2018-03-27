require_relative '../config/environment'
require_relative '../app/models/fridge'
def run_tracker
  puts <<~HEREDOC
         Welcome to the fridge Tracker
         What Would you like to do?
         1. See all of your fridges
         2. Add a Fridge
         3. Delete a Fridge
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  if user_descision == 1
    p Fridge.all
    puts "Enter ID number of fridge"
    fridge_id = gets.chomp.to_i
    checkout_fridge(fridge_id)

  elsif user_descision == 2
    puts "what is the Brand Name?"
    brand = gets.chomp
    puts "Where is it located?"
    location = gets.chomp
    puts "What size is it?"
    size = gets.chomp.to_i
    puts "Got some eat eat? t/f"
    # yes = true and No = false
    food_input = gets.chomp
    if food_input == 't'
     food_input = true
    elsif food_input == "f"
      food_input = false
    end 
    puts "Got some Juice? t/f"
    # yes = true and No = false
    drink_input = gets.chomp
    if drink_input == 't'
     drink_input = true

    elsif drink_input == "f"
      drink_input = false
    end 
  Fridge.create(brand: brand, location: location, size: size, has_food_in_it: food_input, has_drinks_in_it: drink_input)
  elsif user_descision == 3
    # print out all the fridges
   p Fridge.all.select("brand", "location")
    # user selects which fridge they want to delete
    puts "which fridge would you like to delete?"
    delete = gets.chomp
    Fridge.find_by_brand(delete).destroy
  end
end
#========PART 2===============================#
def checkout_fridge(fridge_id)
  id = fridge_id
  
  # Find and Print a Fridge
  puts <<~HEREDOC
         What would you like to do with the fridge?
         1. Checkout the Food
         2. Checkout the Drinks
         3. Return to fridge Menu
         select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  if user_descision == 1
    p Fridge.find(id).foods.all
end
if user_descision == 2
  p Fridge.find(id).drinks.all
end
if user_descision == 3
  puts "Would you like to see the food menu? y/n"
  user_descision = gets.chomp
  fridge = Fridge.find(id)
  if user_descision == "y"
    run_food_menu(fridge)
  else 
    puts "would you like to see the drink menu? y/n"
    fridge = gets.chomp
    run_drink_menu(fridge) 
  end
 
  
end
         end
def run_food_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View All Food Items in a specific Firdge
         2. Add a food item to a fridge
         3. Eat a food item from a fridge
         4. Go Back to Fridge Menu
         Select a number:
       HEREDOC
       
  user_descision = gets.chomp.to_i
  # Your Code Here
end
def run_drink_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View all drink items in a specific fridge
         2. Add a drink item to a fridge
         3. Consume PART of a drink from a fridge
         4. Consume ALL of a drink from a fridge
         5. Go Back to Fridge Menu
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  # Your Code Here
end

run_tracker
