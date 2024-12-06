require 'minitest/autorun'

require_relative 'library'

class BookTest < Minitest::Test
  def setup
    @book = Book.new("The Great Gatsby", "Scott F. Fitzgerald", "4563234")
  end

  def test_check_out
    available = "The Great Gatsby has been checked out.\n"
    assert_equal(true, @book.available)
    assert_output (available) { @book.check_out }

    assert_equal(false, @book.available)
    not_available = "Sorry, The Great Gatsby is not available.\n"

    assert_output(not_available) do
      @book.check_out
    end
  end

  def test_return_book
    still_here = "The Great Gatsby is already in the library.\n"
    assert_output(still_here) { @book.return_book }
    @book.available = false

    returned_output = "The Great Gatsby has been returned.\n"
    assert_output(returned_output) { @book.return_book }
    assert_equal(true, @book.available )
  end

  def test_display_info
    output = <<~OUTPUT
    Title: The Great Gatsby
    Author: Scott F. Fitzgerald
    ISBN: 4563234
    Available: Yes
    ------------------------
    OUTPUT

    assert_output(output) { @book.display_info }
  end
end

class LibraryTest < Minitest::Test
  def setup
    @book1 = Book.new("The Great Gatsby", "Scott F. Fitzgerald", "4563234")
    @book2 = Book.new("1984", "George Orwell", "9780451524935")
    @library = Library.new
  end

  def test_add_book
    output = "1984 has been added to the library.\n"
    assert_output(output) { @library.add_book(@book2) }

    assert_includes(@library.books, @book2)
  end

  def test_include?
    assert_equal(false, @library.include?("1984"))
    @library.add_book(@book2)
    assert_equal(true, @library.include?("1984"))
  end

  def test_find_book
    assert_nil(@library.find_book(@book1))
    @library.add_book(@book2)
    assert_equal(@book2, @library.find_book('1984'))
  end

  def test_list_books
    @library.add_book(@book1)
    @library.add_book(@book2)

    output = <<~OUTPUT
    Library Inventory:
    ------------------------
    Title: The Great Gatsby
    Author: Scott F. Fitzgerald
    ISBN: 4563234
    Available: Yes
    ------------------------
    Title: 1984
    Author: George Orwell
    ISBN: 9780451524935
    Available: Yes
    ------------------------
    OUTPUT

    assert_output(output) { @library.list_books }
  end

  def test_select_books
    @library.add_book(@book1)
    @library.add_book(@book2)

    orwell_book = @library.select_books { |book| book.author.start_with?('G') }
    assert_equal([@book2], orwell_book)

    avail_books = @library.select_books { |book| book.available == true }
    assert_equal([@book1, @book2], avail_books)

    gatsby = @library.select_books { |book| book.title == "The Great Gatsby" }
    assert_equal([@book1], gatsby)

    no_books = @library.select_books { |book| !book.author }
    assert_empty(no_books)
  end
end