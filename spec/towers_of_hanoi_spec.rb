require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  let(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it "initializes with 3 towers" do
      expect(game.towers.count).to eq(3)
    end
    it "sets initial towers" do
      expect(game.towers).to eq([[3,2,1], [], []])
    end
  end

  describe '#move_piece' do
    it 'moves top piece to specified tower' do
      game.move_piece(0, 1)
      expect(game.towers).to eq([[3,2], [1], []])
    end
    it 'does not move to an invalid tower' do
      game.move_piece(0, 1)
      expect { game.move_piece(0, 1) }.to raise_error('invalid move')
    end
    it 'does not allow moves from empty towers' do
      expect { game.move_piece(1, 0) }.to raise_error('empty tower')
    end
  end

  describe '#won?' do
    it 'returns true when final tower is built successfully' do
      game.towers = [[],[],[3,2,1]]
      expect(game.won?).to be true
    end
    it 'returns false when no towers are built successfully' do
      game.towers = [[3,2,1],[],[]]
      expect(game.won?).to be false
      game.towers = [[3], [2,1], []]
      expect(game.won?).to be false
    end
  end
end
