class BinarySearch
  def initialize(array)
    @array = array
  end

  def search_for(element, search_array = @array)
    return nil if search_array.empty?
    return nil if element > search_array.max
    return nil if element < search_array.min

    midpoint = array_midpoint(search_array)
    candidate = search_array[midpoint]

    return @array.index(element) if candidate == element

    new_array = sub_array(search_array, element, candidate, midpoint)

    return nil if new_array == search_array

    search_for(element, new_array)
  end

  private

  def array_midpoint(array)
    midpoint = array.size / 2
    array.size % 2 == 0 ? midpoint - 1 : midpoint
  end

  def sub_array(search_array, element, candidate, midpoint)
    if element < candidate
      search_array[..midpoint]
    else
      search_array[midpoint+1..]
    end
  end
end
