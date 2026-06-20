def bubble_sort(array)
  end_index = array.length - 1
  
  loop do
    did_swap = false

    (0...end_index).each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        did_swap = true
      end
    end

    break unless did_swap
    end_index -= 1
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
