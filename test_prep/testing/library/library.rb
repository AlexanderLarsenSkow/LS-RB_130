class Book
  attr_reader :title, :author, :isbn
  attr_accessor :available

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @available = true
  end

  def check_out
    if @available
      @available = false
      puts "#{@title} has been checked out."
    else
      puts "Sorry, #{@title} is not available.\n"
    end
  end

  def return_book
    if !@available
      @available = true
      puts "#{@title} has been returned."
    else
      puts "#{@title} is already in the library."
    end
  end

  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "ISBN: #{@isbn}"
    puts "Available: #{@available ? 'Yes' : 'No'}"
    puts "------------------------"
  end
end

class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
    puts "#{book.title} has been added to the library."
  end

  def include?(book_name)
    @books.any? { |book| book.title.downcase == book_name.downcase }
  end

  def find_book(title)
    @books.find { |book| book.title.downcase == title.downcase }
  end

  def list_books
    puts "Library Inventory:"
    puts "------------------------"
    @books.each(&:display_info)
  end

  def select_books
    selected_books = []
    @books.each do |book|
      selected_books << book if yield(book)
    end
    selected_books
  end
end

# Usage example
library = Library.new

book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "9780743273565")
book2 = Book.new("To Kill a Mockingbird", "Harper Lee", "9780446310789")
# book3 = Book.new("1984", "George Orwell", "9780451524935")

# book1.display_info

# book1.check_out
# book1.check_out

# library.add_book(book1)
# library.add_book(book2)
# library.add_book(book3)

# library.list_books

# book1.check_out
# book1.check_out
# book1.return_book

# book2.check_out

# library.list_books