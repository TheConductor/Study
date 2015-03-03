class RemoveDuplicatesFromArray
  attr_accessor :array

  def remove_duplicates(array)
    array_start_size =  array.size # used to insure whole array is itterated over
    items_removed    = 0 # used to adjust the index of the for loop to the index of the element that needs to be removed as indexs will not match up with i as items are removed
    last_item        = nil # used to compare the last item to the current item
    array = array.sort # problem states the array is pre sorted, this is just allows me to pass it unsorted arrays as well.
    for i in 0..array_start_size
      adjusted_index = i - items_removed
      if array[adjusted_index] == last_item
        array.delete_at(adjusted_index)
        items_removed += 1
      end
      last_item = array[adjusted_index]
    end
    return array
  end
end
