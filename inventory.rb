## Inventory optimization

## Finally, you got it! You found the Infinite Treasure of the Leprechaun-Dragon!


## Now, you have to decide what to loot. Your inventory is a 5x4 rectangle (5 tiles width, 4 tiles height).


## Each item of the treasure also fits in a rectangle and has a value:



## Potion of Potionentiality, 1x1, 30 gold,

## Jeweled Dog Draught Excluder, 3x1, 150 gold,

## Spartan Shield, 2x2, 300 gold,

## Palindromic Sword o’Drows, 1x3, 120 gold,

## Unobsidian Armor, 2x3, 540 gold,

## Wardrobe of Infinite Lions, 20x10, 1337 gold.


## You can not turn the items. For example, the Unobsidian Armor is 2 tiles in width and 3 in height. It can not be 3 tiles in width and 2 in height.


## Since it’s an Infinite Treasure, there are as many items of each type as you want.


## Which items do you take, and how do you organize them in your inventory to have the most significant value in gold?


## Try to code a generic solution that works with other inventory sizes and item types with specified dimensions and values.


## RPG inventory


## Images from Quaternius. Public domain.

def inventory_optimization(inventory_size, item_dimensions, item_values)
  # Create a list of all possible combinations of items that can fit in the inventory.
  possible_combinations = []
  item_dimensions.each do |item_dimension|
    possible_combinations << item_dimension.repeated_permutation(inventory_size)
  end

  # Find the combination of items that has the highest value.
  best_combination = possible_combinations.max_by { |combination| combination.inject(:+) }

  # Return the value of the best combination.
  return best_combination.inject(:+)
end

# Test the inventory optimization function.
inventory_size = [5, 4]
item_dimensions = [
  [1, 1],
  [3, 1],
  [2, 2],
  [1, 3],
  [2, 3],
  [20, 10],
]
item_values = [
  30,
  150,
  300,
  120,
  540,
  1337,
]

best_combination = inventory_optimization(inventory_size, item_dimensions, item_values)

puts "The best combination of items has a value of #{best_combination}."


