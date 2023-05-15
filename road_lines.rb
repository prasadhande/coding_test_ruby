## Unpaint road lines

## We built a brand new interstate road. Then, we painted white lines on it, but in the wrong places. We tried to correct it by painting more lines, sometimes on the existing ones, sometimes not. It was still wrong. We repainted it so many times it is now a total mess.


## We want to remove all those ugly lines and start over. To do this, we must know which parts of the road are painted. Fortunately, we kept all the logs of our previous paintings.


## Since it is a straight road, the logs consist of one-dimensional coordinates. For example: (3, 10, 14, 20, 1, 5) means that some white color was painted between the coordinates x=3 and x=10, then some other painted between x=14 and x=20, and between x=1 and x=5. There are overlappings, and nothing is ordered. We really messed up everything.


## We want the coordinates of all the painted intervals, in numerical order, to know where to put our solvent. With the previous example, the result would be: (1, 10, 14, 20). There is paint between x=1 and x=10, then between x=14 and x=20.


## Bonus 1

## The coordinates are decimal values, not integers.


## Bonus 2

## Multiple painting layers are harder to remove and need another type of solvent. So, we must differentiate the parts with fewer than 5 overlapped layers from those with 5 or more.


## The output will now consist of a list of integers packed by 3 :



## the strength of the needed solvent (1 or 5),

## the start coordinate,

## the end coordinate.


## For example, this log: (1, 7, 1, 7, 1, 11, 1, 7, 1, 7) will produce this output: (5, 1, 7, 1, 7, 11).


## A strong solvent from x=1 to x=7, then a light solvent from x=7 to x=11.


def remove_road_lines(log)
  intervals = []
  i = 0

  while i < log.length
    start_coord = log[i]
    end_coord = log[i]

    while i + 1 < log.length && log[i + 1] <= end_coord
      i += 1
      end_coord = log[i]
    end

    intervals << start_coord << end_coord
    i += 1
  end

  intervals.uniq.sort
end

def determine_solvent_strength(log)
  intervals = remove_road_lines(log)
  solvents = []

  i = 0
  while i < intervals.length
    start_coord = intervals[i]
    end_coord = intervals[i]
    count = 1

    while i + 1 < intervals.length && intervals[i + 1] <= end_coord + 1
      i += 1
      end_coord = intervals[i]
      count += 1
    end

    strength = count >= 5 ? 5 : 1
    solvents << strength << start_coord << end_coord
    i += 1
  end

  solvents
end



log = [1, 7, 1, 7, 1, 11, 1, 7, 1, 7]
solvents = determine_solvent_strength(log)
puts solvents.inspect
