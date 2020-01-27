def advanced_quicksort(arr, left = 0, right = 0, pivot = arr.size - 1)
    return if left >= pivot
  
    next_left = left
    left = array_partition(arr, left, right, pivot)
  
    pivot_swap(arr, left, pivot)
    puts arr.join(' ')
    advanced_quicksort(arr, next_left, next_left, left - 1)
    advanced_quicksort(arr, left + 1, left + 1, pivot)
  end
  
  def array_partition(arr, left, right, pivot)
    while right < pivot
      left += 1 while left < pivot && arr[left] < arr[pivot]
      right = left
      right += 1 while arr[right] > arr[pivot]
      swap(arr, left, right) if left < right
    end
    left
  end
  
  def pivot_swap(arr, left, pivot)
    swap(arr, left, pivot) if left < pivot
  end
  
  def swap(arr, first, second)
    return if arr[first] < arr[second]
  
    arr[first], arr[second] = arr[second], arr[first]
  end