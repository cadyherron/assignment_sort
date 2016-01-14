def insert(array, right_index, value)
    # value is the value of array[right_index + 1]
    # right_index is the furthest right sorted element

    # Step through sorted elements right to left.
    # As long as your value is less than the element
    # at array[i] and you still have elements
    i = right_index
    while(i >= 0 && array[i] > value)
        # copy the element
        array[i+1] = array[i]
        i -= 1
    end

    # insert the actual element
    array[i+1] = value;
end


def insertion_sort(array)

    result = [array[0]]
    index = 0

    while index < (array.length - 1)
        insert(result, index, array[index+1])
        index += 1
    end
    result
end

# p insertion_sort( [1,3,7,2,5, 4, 5] )


def bubble_sort(array)
    # compare two elements
    # if right is smaller than left, swap them out
    # continue until sorting does 0 swaps on the array

    array.length.times do |pass|
        (array.length - pass).times do |swap_index|
            break if swap_index == array.length-1
            if array[swap_index] > array[swap_index+1]
                larger_item = array[swap_index]
                smaller_item = array[swap_index+1]
                array[swap_index] = smaller_item
                array[swap_index+1] = larger_item
            end
        end
    end
    array
end

# p bubble_sort( [1,3,7,2,5] )



def merge_sort(array)
  return array if array.length == 1
  left = merge_sort(array[0..array.length/2-1])
  right = merge_sort(array[array.length/2..-1])
  return merge(left, right)
end


# function merge(leftArr, rightArr){
def merge(left_arr, right_arr)
#     // var newArr = [];
  new_arr = []
#     // compare leftArr[0] and rightArr[0]
#     // whichever is smaller, push it onto newArr
  until left_arr.empty? && right_arr.empty?
    if left_arr.empty?
      right_arr.each {|item| new_arr << item}
      return new_arr
    elsif right_arr.empty?
      left_arr.each {|item| new_arr << item}
      return new_arr
    end
    if left_arr[0] < right_arr[0]
      new_arr << left_arr.shift
    else
      new_arr << right_arr.shift
    end
  end
  new_arr
end

#p merge([5,6,7,8], [1,2,3])
#puts merge_sort( [1,3,7,2,5] ).inspect
#puts merge_sort( [7,5,9, 13,-1,0]).inspect
