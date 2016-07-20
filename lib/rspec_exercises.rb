def my_uniq(array)
  new_array = []
  array.each do |el|
    new_array << el unless new_array.include?(el)
  end
  new_array
end
