require 'byebug'

class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move_piece(from, to)
    # debugger
    if @towers[from].empty?
      raise "empty tower"
    elsif @towers[from].last > (@towers[to].last || 4)
      raise "invalid move"
    else
      @towers[to] << @towers[from].pop
    end
  end

  def won?
    (@towers == [[], [3, 2, 1], []]) || (@towers == [[], [], [3, 2, 1]])
  end
end
