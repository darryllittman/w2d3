require 'byebug'
require_relative 'deck'

class Hand

  VALUES = {
    :high_card => 1,
    :pair => 2,
    :two_pair => 3,
    :three_of_a_kind => 4,
    :straight => 5,
    :flush => 6,
    :full_house => 7,
    :four_of_a_kind => 8,
    :straight_flush => 9
  }

  attr_accessor :stack, :value

  def initialize(deck)
    @deck = deck
    @stack = []
    5.times { @stack << @deck.draw_card }
    @value = nil
  end

  def receive_card(card)
    @stack << card
  end

  def hand_worth
    p @stack
    case @stack
    when straight_flush?(@stack)
      @value = VALUES[:straight_flush]
    when four_of_a_kind?(@stack)
      @value = VALUES[:four_of_a_kind]
    when full_house?(@stack)
      @value = VALUES[:full_house]
    when flush?(@stack)
      @value = VALUES[:flush]
    when straight?(@stack)
      @value = VALUES[:straight]
    when three_of_a_kind?(@stack)
      @value = VALUES[:three_of_a_kind]
    when two_pair?(@stack)
      @value = VALUES[:two_pair]
    when pair?(@stack)
      @value = VALUES[:pair]
    when high_card?(@stack)
      @value = VALUES[:high_card]
    end
    @value
  end

  def card_values(stack)
    stack.map(&:value).sort
  end

  def card_suits(stack)
    stack.map(&:suit)
  end

  def straight_flush?(stack)
    # debugger
    first_card_suit = stack.first.suit
    card_values = card_values(stack)#stack.map { |card| card.value }.sort
    stack.all? { |card| first_card_suit == card.suit } &&
    stack.all? { |card| card_values.uniq} &&
    (card_values.last - card_values.first == 4)
  end

  def four_of_a_kind?(stack)
    value_stack = card_values(stack)
    value_stack.any? {|value| value_stack.count(value) == 4 }
  end

  def full_house?(stack)
    value_stack = card_values(stack)
    trip_val = value_stack.select do |value|
      value_stack.count(value) == 3
    end

    double_val = value_stack.select do |value|
      value_stack.count(value) == 2
    end

    (trip_val + double_val).count == 5
  end

  def flush?(stack)
    card_suits(stack).uniq.count == 1
  end

  def straight?(stack)
    value_stack = card_values(stack)
    value_stack.last - value_stack.first == 4
  end

  def three_of_a_kind?(stack)
    value_stack = card_values(stack)
    trip_val = value_stack.select do |value|
      value_stack.count(value) == 3
    end

    trip_val.count == 3
  end

  def two_pair?(stack)
    value_stack = card_values(stack)
    double_val = value_stack.select do |value|
      value_stack.count(value) == 2
    end

    double_val.count == 4
  end

  def pair?(stack)
    value_stack = card_values(stack)
    double_val = value_stack.select do |value|
      value_stack.count(value) == 2
    end

    double_val.count == 2
  end

  def high_card?(stack)
    value_stack = card_values(stack)
    value_stack == value_stack.uniq
  end
end
