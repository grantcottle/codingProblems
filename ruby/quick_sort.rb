

def quick_sort(array)
    return array if array.length <= 1
    pivot = array.delete_at(rand(array.length))
  
    left = Array.new
    right = Array.new
  
    array.each do |x|
      if x <= pivot
        left << x
      else
        right << x
      end
    end
  
    return *quick_sort(left), pivot ,*quick_sort(right)
  
  end

arr = [20,50,3,12,5,3,9,6,22,40]
quick_sort(arr)