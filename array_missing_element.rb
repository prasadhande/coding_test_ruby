An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

def solution(a)

that, given an array A, returns the value of the missing element.

For example, given array A such that:

  A[0] = 2
  A[1] = 3
  A[2] = 1
  A[3] = 5
the function should return 4, as it is the missing element.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [0..100,000];
the elements of A are all distinct;
each element of array A is an integer within the range [1..(N + 1)].


def solution(a)
  # Create a set to store the elements of the array.
  elements = Set.new(a)

  # Find the smallest integer that is not in the set.
  missing_element = (1..a.size + 1).to_a.find { |element| !elements.include?(element) }

  # Return the missing element.
  return missing_element
end

# Test the solution function.
a = [2, 3, 1, 5]

missing_element = solution(a)

puts missing_element # => 4
