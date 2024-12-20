# Rules:
  # a set is a collection that has all numbers.
  # uniqueness: all elements should be unique, according to google
  # unordered and all elements should be unique.

# Examples:
  # disjoint?
    # [1, 2] => [3, 4]
    # false because 1 and 2 are not present in the 3 and 4 array

  # difference
    # [1, 2, 3] differnence [3, 4, 5]
    # => [1, 2] because 3 is present in both.

# Data Structures:
  # CustomSet Class

    # empty? method returns true if empty and false if not
    # contains? returns true if it has the element and false if not
    # subset? returns true if the calling object is a subset of the argument for the method. Should be a set.
    # disjoint? returns true if they don't share any elements, else false
    # eql? returns true if all the elements of the calling object are in the argument object

    # add(argument) adds teh argument to the set with push probably
      # add doesn't push in if the element is already present.

    # intersection(new set)
      # calling object that is empty interescting with filled CustomSet object returns empty set... hmm
      # if either the calling object or argument are empty it returns an empty set
      # intersection sounds like where they intersect... as in, the shared elements are saved. Yep, that's it.

    # difference
      # likely returns all the different or unshared elements.
      # empty calling object with filled argument returns empty set
      # removes every element from the calling object that is presetn in the argument.

    # union
      # adds all unique elements in

  # so far my idea is to use an array instance variable that is empty if no arguments
    # are given for the constructor method.
  # This is tricky is because I'm not sure what is expected from some of the later methods in the tests.
  # a subset is like a subarray. Interesting. so if the other set contains all of the values
    # in the other set. Nice.

# Algorithm:
  # CustomSet class
    # constructor, one argument defaults to nil
      # instance variable @set is empty array if the arg is nil, else it is assigned to the array

    # empty? returns true if empty
    # contains? returns true if it includes the element
    # subset? returns true if the calling object is a subset of the other set
      # that means, the other set includes all its elements.

    # disjoint? Returns false if they share any elements
    # eq? returns true if all elements in calling object are in argument and tehy're the same size

    # add pushes in a new element. Unique the array
    # intersection: select all values from the calling object that appear in the argument
    # difference, reject all values from the calling obejct that appear in the argument
    # union, add every element that is not present in the calling object.

class CustomSet
  OTHER_CONTAINS = proc { |other, element| other.contains? element }

  def initialize(set = [])
    @elements = set.uniq
  end

  def empty?
    elements.empty?
  end

  def size
    elements.size
  end

  def contains?(element)
    elements.include? element
  end

  def subset?(other_set)
    elements.all? { |element| OTHER_CONTAINS.call(other_set, element) }
  end

  def disjoint?(other_set)
    elements.none? { |element| OTHER_CONTAINS.call(other_set, element) }
  end

  def eql?(other_set)
    subset?(other_set) && size == other_set.size
  end

  alias_method :==, :eql?

  def add(element)
    elements << element unless self.contains? element
    self
  end

  def intersection(other_set)
    intersect = elements.select { |element| OTHER_CONTAINS.call(other_set, element) }
    CustomSet.new(intersect)
  end

  def difference(other_set)
    difference = elements.reject { |element| OTHER_CONTAINS.call(other_set, element) }
    CustomSet.new(difference)
  end

  def union(other_set)
    union_set = CustomSet.new(elements)
    other_set.each { |element| union_set.add(element) }
    union_set
  end

  def each
    elements.each do |element|
      yield(element) if block_given?
    end

    self
  end

  private

  attr_reader :elements
end
