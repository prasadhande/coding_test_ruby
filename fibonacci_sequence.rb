
## 2048-bonacci

## 2048 is a tiny video game that was super hype some years ago. You had to fuse two equal numbers to create its double. So 1 and 1 became 2, 2 and 2 became 4, and so on.


## Fibonacci was a famous mathematician who made the super-hype Fibonacci sequence you may have heard about: U(n+1) = U(n) + U(n-1). The first number of the sequence are 1, 1, 2, 3, 5, 8, 13, …


## Let’s combine these two hype things to create a super-super-hype game!


## 2048-bonacci plays on a 4x4 square. Each square is either empty or contains a number of the Fibonacci sequence.


## You are given an initial board situation (a 2D array of integers) and a pushing direction (up, left, down, or right). Then, you must compute the board contents after the push and return an updated 2D array of integers.


## The value of integers in the array is guaranteed to be less than 2^16 and are all Fibonacci numbers. The value 0 means the square is empty.


## Rule 1

## Numbers move as far as possible in the pushing direction.

==begin
-------------                       -------------
| 2|  |  |  |                       |  |  |  |  |
-------------                       -------------
|  |  |13|  |                       |  |  |  |  |
-------------  => push downward =>  -------------
|  |  |  |  |                       | 2|  |  |  |
-------------                       -------------
| 5|  |  |  |                       | 5|  |13|  |
-------------                       -------------

Rule 2

When two consecutive numbers in the Fibonacci sequence are pushed one on another, they fuse into the next number.


-------------                       -------------
|  |  | 1| 2|                       |  |  |  | 3|
-------------                       -------------
| 1|  | 1|  |                       |  |  |  | 2|
-------------  => push rightward => -------------
|  | 8| 5|  |                       |  |  |  |13|
-------------                       -------------
|  | 5| 8|  |                       |  |  |  |13|
-------------                       -------------

Rule 3

Fusing orders are resolved in the backward direction of the push.


A fused number can not be fused once again in the same turn.


-------------                 -------------                 -------------
|  | 1| 2| 3|                 |  |  | 1| 5|                 |  |  | 1| 5|
-------------                 -------------                 -------------
|  | 3| 2| 1|                 |  |  | 3| 3|                 |  |  | 3| 3|
------------- => rightward => ------------- => rightward => -------------
|  |  |  |  |                 |  |  |  |  |                 |  |  |  |  |
-------------                 -------------                 -------------
|  | 5| 3| 5|                 |  |  | 5| 8|                 |  |  |  |13|
-------------                 -------------                 -------------

Rule 4

Numbers can move to a square that a fusing has just emptied.


-------------                     -------------
| 1|  |  |  |                     | 2|  |  |  |
-------------                     -------------
| 1|  |  |  |                     | 2|  |  |  |
-------------  => push upward =>  -------------
| 1|  |  |  |                     |  |  |  |  |
-------------                     -------------
| 1|  |  |  |                     |  |  |  |  |
-------------                     -------------

Let’s hype!
==end

def fibonacci(n)
  return n if n <= 1

  a, b = 1, 1
  (n - 2).times do
    a, b = b, a + b
  end
  b
end

def move(board, direction)
  case direction
  when 'up'
    board = board.transpose
    board.each { |row| row.replace(row.reject(&:zero?).reduce([], &method(:merge_fibonacci))) }
    board = board.transpose
  when 'down'
    board = board.transpose
    board.each { |row| row.replace(row.reverse.reject(&:zero?).reduce([], &method(:merge_fibonacci)).reverse) }
    board = board.transpose
  when 'left'
    board.each { |row| row.replace(row.reject(&:zero?).reduce([], &method(:merge_fibonacci))) }
  when 'right'
    board.each { |row| row.replace(row.reverse.reject(&:zero?).reduce([], &method(:merge_fibonacci)).reverse) }
  end
  board
end

def merge_fibonacci(acc, num)
  if acc.empty? || acc.last != num
    acc << num
  else
    acc[-1] += num
  end
  acc
end

# Example usage
board = [
  [0, 1, 2, 3],
  [0, 3, 2, 1],
  [0, 0, 0, 0],
  [0, 5, 3, 5]
]
direction = 'right'
result = move(board, direction)
puts result.map { |row| row.join(' ') }.join("\n")













require 'matrix'

class Bonacci
  attr_reader :board, :direction

  def initialize(board, direction)
    @board = board
    @direction = direction
  end

  def update
    # Move all numbers as far as possible in the pushing direction.
    moved_numbers = []
    case direction
    when :up
      moved_numbers += move_up
    when :down
      moved_numbers += move_down
    when :left
      moved_numbers += move_left
    when :right
      moved_numbers += move_right
    end

    # Fuse any consecutive numbers in the Fibonacci sequence.
    new_board = board.map do |row|
      row.map do |number|
        if number && row.index(number + 1)
          next number + 1
        else
          number
        end
      end
    end

    # Fill any empty squares with 0.
    new_board.each_index do |i|
      new_board[i] = new_board[i].fill(0) until new_board[i].any?
    end

    # Return the updated board.
    new_board.map { |row| row.compact }
  end

  private

  def move_up
    moved_numbers = []
    board.each_with_index do |row, y|
      row.each_with_index do |number, x|
        if number
          while y > 0 && board[y - 1][x].zero?
            board[y - 1][x] = number
            board[y][x] = 0
            y -= 1
            moved_numbers << [y, x]
          end
        end
      end
    end
    moved_numbers
  end

  def move_down
    moved_numbers = []
    board.reverse.each_with_index do |row, y|
      row.each_with_index do |number, x|
        if number
          while y < board.size - 1 && board[y + 1][x].zero?
            board[y + 1][x] = number
            board[y][x] = 0
            y += 1
            moved_numbers << [y, x]
          end
        end
      end
    end
    moved_numbers.map { |y, x| [board.size - 1 - y, x] }
  end

  def move_left
    moved_numbers = []
    board.each_with_index do |row, y|
      row.each_with_index do |number, x|
        if number
          while x > 0 && board[y][x - 1].zero?
            board[y][x - 1] = number
            board[y][x] = 0
            x -= 1
            moved_numbers << [y, x]
          end
        end
      end
    end
    moved_numbers
  end

  def move_right
    moved_numbers = []
    board.each_with_index do |row, y|
      row.reverse.each_with_index do |number, x|
        if number
          while x < row.size - 1 && board[y][x + 1].zero?
            board[y][x + 1] = number
            board[y][x] = 0
            x += 1
            moved_numbers << [y, x]
          end
        end
      end
    end
    moved_numbers.map { |y, x| [y, row.size - 1 - x] }
  end
end
  
  
  board = [[0, 0, 0, 0],
          [0, 0, 0, 0],
          [0, 0, 1, 2],
          [0, 0, 5, 8]]

direction = :up

game = Bonacci.new(board, direction)

new_board = game.update

