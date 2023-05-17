A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

For example, consider array A such that:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
We can split this tape in four places:

P = 1, difference = |3 − 10| = 7
P = 2, difference = |4 − 9| = 5
P = 3, difference = |6 − 7| = 1
P = 4, difference = |10 − 3| = 7
Write a function:

def solution(a)

that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

For example, given:

  A[0] = 3
  A[1] = 1
  A[2] = 2
  A[3] = 4
  A[4] = 3
the function should return 1, as explained above.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [2..100,000];
each element of array A is an integer within the range [−1,000..1,000].


    
  def solution(a)
  # Calculate the sum of all the elements in the array.
  total_sum = a.inject(:+)

  # Create a list to store the minimum difference between the sums of the two parts of the tape for each possible split point.
  minimum_differences = []

  # Iterate over all possible split points.
  (1..a.size - 1).each do |split_point|
    # Calculate the sum of the first part of the tape.
    first_part_sum = a[0...split_point].inject(:+)

    # Calculate the sum of the second part of the tape.
    second_part_sum = a[split_point..-1].inject(:+)

    # Calculate the minimum difference between the sums of the two parts of the tape.
    minimum_differences << (first_part_sum - second_part_sum).abs()
  end

  # Return the minimum difference between the sums of the two parts of the tape.
  return minimum_differences.min
end

# Test the solution function.
a = [3, 1, 2, 4, 3]

minimum_difference = solution(a)

puts minimum_difference # => 1
