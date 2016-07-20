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
