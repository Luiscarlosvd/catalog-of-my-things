require_relative '../item'
require_relative 'author'
require_relative 'genre'
require_relative 'label'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.list_all_books(books)
    index = 1
    if books.empty?
      puts 'No Books found'
    else
      puts 'List of all books: '
      books.each do |book|
        if book.instance_of? Book
          puts "#{index}) (ID:#{book.id}) The book: #{book.label.title} , Author: #{book.author.first_name} #{book.author.last_name}, Genre: #{book.genre.name}, Publish Date: #{book.publish_date}"
          index += 1
        end
      end
    end
  end

  def self.add_books(books, genre, authors, labels)
    print 'Enter name of the book: '
    label_title = gets.chomp
    print 'Book\'s creator first name: '
    author_first_name = gets.chomp
    print 'Book\'s creator last name: '
    author_last_name = gets.chomp
    print 'Enter the book\'s genre: '
    genre_name = gets.chomp
    print 'Enter the book\'s publisher: '
    publisher_name = gets.chomp
    print 'Enter the book\'s cover state: '
    cover_state = gets.chomp
    print 'Enter the book\'s color: '
    label_color = gets.chomp

    # item inputs
    print "\nWhat's the publish date? [year] "
    print "\nAnswer: "
    book_date = gets.chomp.to_i

    new_book = Book.new(publisher_name, cover_state, book_date)

    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_book)

    new_label = Label.new(label_title, label_color)
    new_label.add_item(new_book)

    books << new_book
    authors << new_author
    genre << new_genre
    labels << new_label

    puts 'Book added!'
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
