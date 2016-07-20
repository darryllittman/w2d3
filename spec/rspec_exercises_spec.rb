require 'rspec'
require 'rspec_exercises'

describe 'Array::my_uniq' do
  it 'removes all duplicated elements' do
    expect([1,2,2,2,2,3,4].my_uniq).to eq([1,2,3,4])
  end
end

describe "Array::two_sum" do
  it "returns an array with indices of pairs that sum to zero in order" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array::my_transpose" do
  it "transposes an array" do
    expect([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ].my_transpose).to eq([[0, 3, 6],
             [1, 4, 7],
             [2, 5, 8]])
  end
end

describe '#stock_prices' do
  it 'finds most profitable pair' do
    expect(stock_prices([0.01, 0.52, 1.08, 0.08, 1.04])).to eq([0, 2])
    expect(stock_prices([5.3, 1, 7.8, 45, 46])).to eq([1, 4])
  end
end
