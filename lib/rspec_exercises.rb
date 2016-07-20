
class Array
  def my_uniq
    new_array = []
    each do |el|
      new_array << el unless new_array.include?(el)
    end
    new_array
  end

  def two_sum
    indices = []
    each_with_index do |el, i|
      self.each_with_index do |el2, j|
        next if i == j || i > j
        indices << [i, j] if el + el2 == 0
      end
    end

    indices
  end
end
