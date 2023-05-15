## The random Candyman

## The random Candyman puts candy sticks in his candy bag. They have various sizes and can be green or red. When someone asks for a candy stick, the Candyman randomly gets one from his bag.

## The Candyman would like to inform people about the average size of the following candy stick that will be chosen and the chance to have a red one. But he wants to keep his bag contents private and may be too lazy to inspect the bag by himself. Fortunately, the Candyman knows basic mathematics and can remember a few numbers.
## How can the Candyman inform people about his candies?
## You have to implement a CandyMan class or structure containing a list of candy sticks. The class must have the methods:

## add_candy

## get_a_random_candy

## get_average_size

## get_red_candy_chance.


## You are forbidden to browse the candy list when calling the last two functions, and you can rely only on 3 numbers the Candyman can remember. The quantities will stay reasonable, and the Candyman will never have billions of candy sticks in his bag.



class CandyMan
  def initialize
    @candy_sticks = []
    @total_size = 0
    @red_candy_count = 0
    @candy_count = 0
  end

  def add_candy(size, color)
    @candy_sticks << [size, color]
    @total_size += size
    @red_candy_count += 1 if color == "red"
    @candy_count += 1
  end

  def get_a_random_candy
    @candy_sticks.sample
  end

  def get_average_size
    @total_size.to_f / @candy_count
  end

  def get_red_candy_chance
    (@red_candy_count.to_f / @candy_count) * 100
  end
end



candyman = CandyMan.new

candyman.add_candy(10, "green")
candyman.add_candy(15, "red")
candyman.add_candy(12, "green")

random_candy = candyman.get_a_random_candy
puts "Random candy: #{random_candy}" # Example output: Random candy: [10, "green"]

average_size = candyman.get_average_size
puts "Average size: #{average_size}" # Example output: Average size: 12.333333333333334

red_candy_chance = candyman.get_red_candy_chance
puts "Red candy chance: #{red_candy_chance}%" # Example output: Red candy chance: 33.333333333333336%
