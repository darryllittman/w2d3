require 'rspec'
require 'hand'

describe Hand do
  let(:king_h) { double(:Card, :value => 12, :suit => :h ) }
  let(:king_d) { double(:Card, :value => 12, :suit => :d ) }
  let(:king_s) { double(:Card, :value => 12, :suit => :s ) }
  let(:king_c) { double(:Card, :value => 12, :suit => :c ) }
  let(:two_h) { double(:Card, :value => 1, :suit => :h ) }
  let(:two_d) { double(:Card, :value => 1, :suit => :d ) }
  let(:three_h) { double(:Card, :value => 2, :suit => :h ) }
  let(:ace_d) { double(:Card, :value => 13, :suit => :d ) }
  let(:ten_h) { double(:Card, :value => 9, :suit => :h ) }
  let(:ten_d) { double(:Card, :value => 9, :suit => :d ) }
  let(:nine_s) { double(:Card, :value => 8, :suit => :s ) }
  let(:jack_d) { double(:Card, :value => 9, :suit => :d ) }
  let(:queen_c) { double(:Card, :value => 9, :suit => :c ) }
  let(:queen_d) { double(:Card, :value => 9, :suit => :d ) }

  let(:deck) { double(:Deck, :draw_card => two_d) }
  let(:hand) { Hand.new(deck) }


  describe '#initialize' do
    it "initializes with five cards drawn from deck" do
      expect(hand.stack.count).to eq(5)
      expect(hand.stack.shuffle.last).to eq(two_d)
    end
  end

  describe '#receive_card' do
    it "adds card to player's stack" do
      hand.receive_card(queen_d)
      expect(hand.stack.count).to eq(6)
    end
  end


  let(:sf_deck) { double(:Deck, :card_stack => [ace_d, king_d, queen_d, jack_d, ten_d],
                                :draw_card => :card_stack.pop) }
  let(:straight_flush_hand) { Hand.new(sf_deck) }

  describe '#hand_worth' do
    it 'sets the correct value for hand combinations' do
      straight_flush_hand.stack = [ace_d, king_d, queen_d, jack_d, ten_d]
      expect(straight_flush_hand.hand_worth).to eq(9)
    end
  end

  describe '#straight_flush' do
    it "correctly identifies straight flush" do
      expect(hand.straight_flush?([ace_d, king_d, queen_d, jack_d, ten_d])).to be true
      expect(hand.straight_flush?([ace_d, king_c, queen_d, jack_d, ten_d])).to be false
    end
  end

  describe '#four_of_a_kind' do
    it "correctly identifies four of a kind" do
      expect(hand.four_of_a_kind?([king_h, king_d, king_s, king_c, two_d])).to be true
      expect(hand.four_of_a_kind?([king_h, two_d, king_s, king_c, two_d])).to be false
    end
  end

  describe '#full_house' do
    it "correctly identifies a full house" do
      expect(hand.full_house?([king_d, king_h, king_s, two_d, two_h])).to be true
      expect(hand.full_house?([king_d, king_h, king_s, three_h, two_h])).to be false
    end
  end

  describe '#three_of_a_kind' do
    it "correctly identifies three of a kind" do
      expect(hand.three_of_a_kind?([king_c, king_h, king_d, two_h, three_h])).to be true
      expect(hand.three_of_a_kind?([king_c, queen_c, king_d, two_h, three_h])).to be false
    end
  end

  describe '#two_pair' do
    it "correctly identifies two pair" do
      expect(hand.two_pair?([two_d, king_c,king_d, two_h, three_h])).to be true
      expect(hand.two_pair?([two_d, king_c,king_d, queen_c, three_h])).to be false
    end
  end

  describe '#pair' do
    it 'correctly identifies a pair' do
      expect(hand.pair?([ace_d, ten_d, king_d, king_c, three_h])).to be true
      expect(hand.pair?([ace_d, ten_d, two_d, king_c, three_h])).to be false
    end
  end

  describe "#high_card" do
    it 'correctly identifies high-card hands' do
      expect(hand.high_card?([ace_d, ten_d, king_d, two_h, three_h])).to be true
      expect(hand.high_card?([ace_d, king_c, king_d, two_h, three_h])).to be false
    end
  end

  describe "#flush?" do
    it "correctly identifies a flush" do
      expect(hand.flush?([king_d, two_d, ten_d, ace_d, jack_d])).to be true
      expect(hand.flush?([ace_d, king_c, king_d, two_h, three_h])).to be false
     end
   end

   describe '#straight' do
     it "correctly identifies a straight" do
       expect(hand.straight?([ace_d, ten_d, king_d, queen_c, jack_d])).to be true
       expect(hand.straight?([ace_d, ten_d, king_d, two_d, jack_d])).to be false
     end
   end
end
