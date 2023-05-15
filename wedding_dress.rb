## What should I wear for these weddings?


## You are invited to weddings. As a trendy person, you always wear a hat at important ceremonies but do not want anyone to see you twice with the same hat. So for each wedding, you have the list of the people that will be present, some of whom will be at multiple weddings.


## How can you determine which hat you will wear for each wedding, using the fewest number of hats possible?


## You may need help finding the optimal algorithm. Try to describe and implement the best one you can.

def determine_hats_for_weddings(weddings)
  hats = {}
  used_colors = Set.new

  weddings.each do |wedding|
    available_colors = Set.new

    wedding.each do |person|
      if hats.key?(person)
        available_colors.add(hats[person])
      end
    end

    wedding.each do |person|
      if !hats.key?(person)
        color = (1..Float::INFINITY).find { |c| !used_colors.include?(c) && !available_colors.include?(c) }
        used_colors.add(color)
        hats[person] = color
      end
    end
  end

  hats
end


weddings = [
  ["Alice", "Bob", "Charlie"],
  ["Bob", "David"],
  ["Charlie", "Eve", "Frank"],
  ["David", "Eve"]
]

hats = determine_hats_for_weddings(weddings)
hats.each do |person, hat_color|
  puts "#{person} will wear hat color #{hat_color}"
end
