require 'rspec'
require 'deck'

describe Deck do
  let(:deck) { Deck.new }
  describe '#initialize' do
    it "contains 52 unique cards" do
      expect(deck.card_stack.uniq.count).to eq(52)
    end
  end

  describe '#draw_card' do
    it "removes a card from the deck" do
      deck.draw_card
      expect(deck.count).to eq(51)
      expect(deck.draw_card).to be_a(Card)
    end
  end

  # describe '#shuffle!' do
  #   it "shuffles the deck" do
  #     current_deck = deck
  #     expect(deck.shuffle!).to_not eq(current_deck)
  #   end
  #   it 'does not remove any cards while shuffling' do
  #     deck.shuffle!
  #     expect(deck.count).to eq(52)
  #   end
  # end

end
