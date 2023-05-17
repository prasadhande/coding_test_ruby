## A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

## For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps:
## one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. 
## The number 32 has binary representation 100000 and has no binary gaps.


def longest_binary_gap(n)
  # Convert the number to binary.
  binary_representation = n.to_s(2)

  # Find the index of the first 1 in the binary representation.
  first_one_index = binary_representation.index("1")

  # If there is no 1 in the binary representation, return 0.
  return 0 if first_one_index.nil?

  # Find the index of the last 1 in the binary representation.
  last_one_index = binary_representation.rindex("1")

  # Create a list of all the zeros between the first and last 1 in the binary representation.
  zeros = binary_representation[first_one_index + 1..last_one_index - 1].scan(/0+/)

  # Find the longest sequence of zeros in the list.
  longest_gap = zeros.max_by(&:length)

  # Return the length of the longest sequence of zeros.
  return longest_gap.length
end

# Test the longest_binary_gap function.
puts longest_binary_gap(9) # => 2
puts longest_binary_gap(529) # => 4
puts longest_binary_gap(20) # => 1
puts longest_binary_gap(15) # => 0
puts longest_binary_gap(32) # => 0
