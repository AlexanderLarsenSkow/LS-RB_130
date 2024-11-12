class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title
  attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.dup
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def done!
    todos.each { |todo| todo.done! }
  end

  def item_at(index)
    todos[index]
  end

  def mark_done_at(index)
    todos[index].done!
  end

  def mark_undone_at(index)
    todos[index].undone!
  end

  def remove_at(index)
    todos.delete_at(index)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    "
    #{title}:
     -----------
    #{todos[0]}
    #{todos[1]}
    #{todos[2]}
    "
  end

  def each
    counter = 0

    while counter < size
      yield(todos[counter])
      counter += 1
    end

    self
  end

  def select
    result = TodoList.new(title)

    todos.each do |todo|
      result << todo if yield(todo)
    end

    result
  end

  def find_by_title(query_title)
    self.each do |todo|
      return todo if todo.title == query_title
    end

    nil
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !todo.done? }
  end

  def mark_done(query_title)
    self.each do |todo|
      return todo.done! if todo.title == query_title
    end
  end

  def mark_all_done
    self.each { |todo| todo.done! }
  end

  def mark_all_undone
    self.each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_all_done

puts list

list.mark_all_undone

puts list

list.mark_done("Buy milk")

puts list

puts list.all_not_done
puts list.all_done

p list.find_by_title("Clean room")
p list.find_by_title("Go shopping") # => nil