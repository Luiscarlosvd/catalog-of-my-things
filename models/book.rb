require './item'

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

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
