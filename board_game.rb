## Do you like board games?

## I love tile-based board games so much that I want to recreate some of them as video games.


## Step 1: generic classes

## First, I need some generic classes. Let’s call them Tile and Board.


## A board will be initialized with a specified width and height and will have a method get_tile(x, y) that returns a Tile object.


## Many board games have elements that impact adjacent tiles. I want to handle that easily, without those “x-1”, “x+1” operations. So the class Tile will have a method get_adjacent(direction) that returns a Tile object. The parameter direction is an integer from 0 to 7, with adjacencies according to this diagram:


## |------|------|------|
## |   7  |   0  |   1  |
## |------|------|------|
## |   6  | Tile |   2  |
## |------|------|------|
## |   5  |   4  |   3  |
## |------|------|------|

## schema board and tile classes


## The Tile class will also contain a member char_data, which will be a single character. Then, the Board could have a method render(), printing these char_datas in a square of width*height characters. It’s rather simplistic, but we need it for debugging.


## The tiles should contain a lot of other information, depending on the board game I’m currently implementing. But we don’t have to care about that for the moment; I will override the class when needed.


## Could you help me code this? With these classes, I could implement chess, draughts, minesweeper, and many other games!


## Step 2: extending the board

## Hey, I discovered some neat games: Carcassonne and Isle of Skye. Their boards do not have a fixed size. They extend in any of the 4 directions when players add new tiles during the game. I want that feature!


## It would be even cooler if it could work in all 8 directions. Extending the board to the up-left diagonal would be the same as extending it up, then to the left.


## While you are at it, the board could extend by many tiles at once: 2 columns leftward, 3 lines downward, …


## Don’t forget to update the tile adjacencies. The method get_adjacent(direction) should still work properly even after an extension.


class Tile
  attr_reader :x, :y, :char_data

  def initialize(x, y, char_data)
    @x = x
    @y = y
    @char_data = char_data
  end

  def get_adjacent(direction)
    case direction
    when 0
      Tile.new(x - 1, y)
    when 1
      Tile.new(x, y - 1)
    when 2
      Tile.new(x + 1, y)
    when 3
      Tile.new(x, y + 1)
    when 4
      Tile.new(x - 1, y - 1)
    when 5
      Tile.new(x + 1, y - 1)
    when 6
      Tile.new(x - 1, y + 1)
    when 7
      Tile.new(x + 1, y + 1)
    end
  end
end

class Board
  attr_reader :width, :height, :tiles

  def initialize(width, height)
    @width = width
    @height = height
    @tiles = Array.new(width) { Array.new(height) }
  end

  def get_tile(x, y)
    @tiles[x][y]
  end

  def extend(x, y, width, height)
    new_tiles = Array.new(width) { Array.new(height) }
    @tiles.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        new_tiles[i + x][j + y] = tile
      end
    end
    @tiles = new_tiles
  end

  def render
    @tiles.each do |row|
      puts row.map(&:char_data).join("")
    end
  end
end

## Execution
board = Board.new(3, 3)

# Create some tiles.
tile1 = Tile.new(0, 0, "X")
tile2 = Tile.new(1, 1, "O")
tile3 = Tile.new(2, 2, "Z")

# Add the tiles to the board.
board.tiles[0][0] = tile1
board.tiles[1][1] = tile2
board.tiles[2][2] = tile3

# Render the board.
board.render
