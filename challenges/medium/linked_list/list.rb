# Input:
# Output:

# Rules:
  # Push in the List class adds a new element to the front of the list. Not to the end.
  # pop takes from the front.
  # A linked list has several things going on:
    # first, every element has a value(datum) and a next (pointer) that points to the next element(which is also a pair.)
    #


# Examples:
  # Linked List
    # [1, =>], [2, =>], [3, =>]

# Data Structures:

# Algorithm
  # Element Class
    # takes two values for a new object
    # first, a value, second a value taht defaults to nil
      # datum method that returns the first element's datum.
    # tail? returns true if the last element is nil.
    # next returns the next element, which is another object from the Element class.
    #

  # SimpleLinkedList Class
    # size method, returns the number of pairs in the list.
    # empty? returns true if the list only has nil in it.
    # push adds element to the end of the list. Should be from the Element class.

      # push takes the array of Elements in the list(Elements array)
      # creating a new Element object using from_a list of Elements from there.
      # rewriting the old instance variable @list

    # peek: I think it returns the head of the list (first item) and the datum as well.
    # pop removes the first element and returns the datum for it.
      #

    # to_a just converts it to an array. So transform the array with map based on the datum.

    # class method from_a(starts a new list that has elements already ready to go.)

class Element
  def initialize(value1, value2 = nil)
    @pair = [value1, value2]
  end

  def datum
    pair[0]
  end

  def tail?
    pair[1] ? false : true
  end

  def next
    pair[1]
  end

  private

  attr_reader :pair
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def self.from_a(values)
    new_list = SimpleLinkedList.new
    return new_list unless values

    values.reverse.each do |value|
      new_list.push value
    end

    new_list
  end

  def push(value)
    next_element = list[0]
    list.unshift Element.new(value, next_element)
  end

  def pop
    list.shift.datum
  end

  def reverse
    elements = self.to_a
    reverse_list = SimpleLinkedList.new

    elements.each do |element|
      reverse_list.push element
    end

    reverse_list
  end

  def to_a
    list.map(&:datum)
  end

  def head
    list.first
  end

  def peek
    empty? ? nil : head.datum
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  private

  attr_accessor :list
end
