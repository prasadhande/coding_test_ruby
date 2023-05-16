## How to beat me at poker

## I like playing poker, but I need to improve at shuffling cards.


## Here is my shuffling method :



## I take the card from the top to start a second pile.

## I take the next card from the top of the pile and put it under the second pile.

## I take the next card from the top of the pile and put it on top of the second pile.

## I repeat the last two steps until no card is in the first pile.


## Given the initial pile of cards, can you guess the order after my shuffling?


## Cards will be defined as strings: “Ace of Spades”, “5 of Hearts”, …




def beat_poker_shuffle(cards)
  # Reverse the order of the cards.
  cards.reverse!

  # Split the cards into two piles.
  first_pile = cards.take(cards.size / 2)
  second_pile = cards.drop(cards.size / 2)

  # Shuffle the first pile.
  first_pile.shuffle!

  # Merge the two piles together.
  cards = first_pile + second_pile

  # Return the shuffled cards.
  cards
end


cards = ["Ace of Spades", "2 of Hearts", "3 of Diamonds", "4 of Clubs"]

shuffled_cards = beat_poker_shuffle(cards)

puts shuffled_cards
