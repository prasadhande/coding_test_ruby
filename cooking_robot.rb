
## Storing ingredients for a cooking robot

## We have built a powerful cooking robot that automatically creates a delicious burger from three ingredients: bread, cheese, and ham.


## However, our supply chain is poorly designed, and the ingredients arrive randomly. Our robot can only start cooking when it has all three ingredients.


## Therefore, we need to know how much of each ingredient we must be able to store to ensure that it won’t mess up the cooking process.


## We have a log that describes a previous sequence of ingredient arrivals. We will use it to compute the storage space needed for each of the three ingredients.


## Here is an example log:


## bread
## bread
## bread
## ham
## cheese
## ham
## ham
## cheese


## After the first four ingredients are received, the robot cannot cook, and we must be able to store the three breads and one ham.

## A burger is made after the first cheese, so the storage now contains only two breads.

## Then, two hams must be stored.

## Finally, a second burger is made after the second cheese.


## So, the global storage capacity must be: 3 breads, 0 cheeses, and 2 hams.


## Your function will take a list of strings as input, corresponding to the log. It will output three integers, respectively defining the storage capacity of bread, cheese, and ham.


## Some ingredients may still be in storage when the log ends. You don’t have to manage them. Our gentle robot will eat them at the end of the day to avoid wasting food.


## Let’s get cooking!

def calculate_storage_capacity(log)
  storage = {
    "bread" => 0,
    "cheese" => 0,
    "ham" => 0
  }

  log.each do |ingredient|
    storage[ingredient] += 1
    storage["bread"] -= 1 if ingredient == "cheese"
    storage["cheese"] -= 1 if ingredient == "ham"
  end

  storage.values
end


log = ["bread", "bread", "bread", "ham", "cheese", "ham", "ham", "cheese"]
storage_capacity = calculate_storage_capacity(log)
puts "Storage capacity: #{storage_capacity}"
