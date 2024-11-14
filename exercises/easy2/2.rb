# Zipper

# Input: two array arguments
# Output: a zipped array

# Rules:
  # Given two arrays, zip them together where the two 1st elements are in the first subarr, and so on
  # assume that the arrays have the same number of elements

# Examples:
  # zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Data Structures:
  # iterate over with each_index
  # iterate over the second collection with each_index
  # If the indexes are the same, add them to the same array
  # add the array to the main array
  # return the array at the end

# Algo ^

def zip(array1, array2)
  zipped_array = []

  array1.each_with_index do |element1, index1|
    subarr = [element1]

    array2.each_with_index do |element2, index2|
      subarr << element2 if index1 == index2
    end

    zipped_array << subarr
  end

  zipped_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def zip2(array1, array2)
  zipped_array = []

  array1.each_with_index do |element, index|
    subarr = [element, array2[index]]
    zipped_array << subarr
  end

  zipped_array
end

p zip2([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
