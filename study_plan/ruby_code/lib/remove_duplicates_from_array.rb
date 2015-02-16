class RemoveDuplicatesFromArray
  attr_accessor :array
  
  def remove_duplicates(array)
    last_item = nil 
    (array.sort).each do |item|
      if item == last_item
        array.delete(item)
        array.push(item)
      end
      last_item = item
    end
    return array
  end
end