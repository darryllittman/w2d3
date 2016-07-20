require 'rspec'
require 'card'

describe Card do
  let(:card) { Card.new(8, :h) }
  describe '#initialize' do
    it "set to an ititial value" do
      expect(card.value).to eq(8)
      expect(card.suit).to eq(:h)
    end
  end
end
