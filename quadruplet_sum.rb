## Quadruplet sums

## Implement a function which finds four numbers within the provided list which have a sum equal to the target.


## An example is provided, but is too slow on larger testcases because it has too many nested loops.



## There will always be at least one valid quadruplet.

## The same number can be used any number of times.

## Numbers can be returned in any order.


## Example

## numbers: [5, 4, 3, 2, 1, 0]


## target: 11


## One possible answer is [1, 2, 3, 5]. Another possible answer is [5, 5, 1, 0].

## Solution 
def find_quadruplet(numbers, target)
  numbers.sort!
  n = numbers.length

  quadruplets = []

  for i in 0..n-4
    for j in i+1..n-3
      left = j + 1
      right = n - 1

      while left < right
        sum = numbers[i] + numbers[j] + numbers[left] + numbers[right]

        if sum == target
          quadruplets << [numbers[i], numbers[j], numbers[left], numbers[right]]
          left += 1
          right -= 1
        elsif sum < target
          left += 1
        else
          right -= 1
        end
      end
    end
  end

  quadruplets
end


## Testing

numbers = [5, 4, 3, 2, 1, 0]
target = 11

quadruplets = find_quadruplet(numbers, target)
quadruplets.each do |quadruplet|
  puts quadruplet.inspect
end
