require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) do
      @list.add(1)
    end

    assert_raises(TypeError) {@list.add('hello') }
  end

  def test_add
    @list.add(Todo.new('Vacuum'))
    assert_equal(4, @list.size)
  end

  def test_push
    @list << Todo.new("Vacuum")
    assert_equal(4, @list.size)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) do
      @list.item_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)

    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
  end

  def test_mark_undone_at
     @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)

    assert_raises(IndexError) do
      @list.mark_undone_at(100)
    end
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal(2, @list.size)

    assert_raises(IndexError) do
      @list.remove_at(100)
    end
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    output2 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

output3 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)

    @todo1.done!
    assert_equal(output2, @list.to_s)

    @list.done!
    assert_equal(output3, @list.to_s)
  end

  def test_each
    test_arr = []
    @list.each { |todo| test_arr << todo }

    assert_equal(@list.to_a, test_arr)
    assert_equal(@list.size, test_arr.size)
    assert_equal(@list.item_at(1), test_arr[1])
  end

  def test_each_return
    test = @list.each { |todo| todo }
    assert_same(@list, test)
  end

  def test_select
    @todo1.done!
    test = @list.select { |todo| todo.done? }
    assert_equal(test.to_a, [@todo1])
  end
end