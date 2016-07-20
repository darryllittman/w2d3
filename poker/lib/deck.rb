require_relative 'card'

class Deck
  attr_reader :card_stack

  SUITS = [:s, :h, :d, :c]
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

  def initialize
    @card_stack = []
    populate_card_stack
    shuffle!
  end

  def populate_card_stack
    VALUES.each do |value|
      SUITS.each {|suit| @card_stack << Card.new(value, suit) }
    end
  end

  def draw_card
    @card_stack.pop
  end

  def count
    @card_stack.count
  end

  private
  def shuffle!
    @card_stack.shuffle!
  end
end
