require 'rspec'
require 'rspec_exercises'

describe '#my_uniq'do
  it 'removes all duplicated elements' do
    expect(my_uniq([1,2,2,2,2,3,4])).to eq([1,2,3,4])
  end
end
