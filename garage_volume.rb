## Foam party in my garage!

## My parents authorized me to throw a foam party in the garage.


## I need to calculate the room’s volume, so I buy the appropriate quantity of foam liquid. Too much would be messy, and too few would not be fun.


## But my dumb parents kept two stupid cardboard boxes in the garage and forbade me to move them. So it decreases the available fun volume!


## Since they are obsessed with cleaning and order, the sides of the cardboard boxes are perfectly aligned with the garage walls and ground, and everything is perfectly rectangular. They tried to put one box into the other but may not have done it completely (as they are dumb).


## I know my garage’s dimensions (width, length, height). I also measured the position of the two boxes (coordinates x, y, z, of two opposite corners of each box).


## The 3 dimensions are always in the same order for every coordinate and size. They are float values.


## The two boxes are always entirely contained in the garage. One may completely, partly, or not be contained in the other. My parents closed them with duct tape and paper so no foam could enter them. (Yes, they managed to pack a box that partly contains another box, don’t ask me how they did that, I don’t care).


## Can you help me calculate the volume available for the foam?

def calculate_volume_available_for_foam(garage_dimensions, box_dimensions)
  garage_volume = garage_dimensions.inject(:*)
  box_volume = box_dimensions.inject(:*)
  volume_available_for_foam = garage_volume - box_volume
  return volume_available_for_foam
end

## Execution

garage_dimensions = [10, 20, 10]
box_dimensions = [5, 10, 5]

volume_available_for_foam = calculate_volume_available_for_foam(garage_dimensions, box_dimensions)

puts volume_available_for_foam
