
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

  def my_transpose
    new_arr = []
    idx = 0
    while idx < self.size
      new_arr[idx] = []
      idx2 = 0
      while idx2 < self.size
        new_arr[idx] << self[idx2][idx]
        idx2 += 1
      end
      idx += 1
    end
    new_arr
  end
end

def stock_prices(stock_info)
  stock_combos = []
  stock_info.each_with_index do |price, day|
    stock_info.each_with_index do |price2, day2|
      next if day >= day2
      stock_combos << [price, price2, [day, day2]]
    end
  end

  stock_combos.sort_by {|price1, price2, options| (price2 - price1).abs  }.last.last

end
