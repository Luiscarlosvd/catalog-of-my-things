require_relative 'message_outputs'
require_relative 'preserveData/write_data'
require_relative 'preserveData/load_data'
require './models/music_album'
require_relative 'models/game'
require './models/author'
require './models/label'
require './models/genre'
require './models/book'

class App
  include WriteData
  include MessageOutputs
  include LoadData
  attr_accessor :music_albums, :genre, :authors, :games, :labels, :books

  def initialize
    @labels = load_labels
    @genre = load_genres
    @authors = load_authors
    @music_albums = load_music_albums
    @games = load_games
    @books = load_books
  end

  def run
    greetings
    loop do
      number_choice = options
      option_selected(number_choice)
    end
  end

  def option_selected(number)
    case number
    when 1
      Book.list_all_books(books)
    when 2
      MusicAlbum.list_all_music_albums(music_albums)
    when 3
      Game.list_all_games(games)
    when 4
      Genre.list_all_genres(genre)
    when 5
      Label.list_all_labels(labels)
    when 6
      Author.list_all_authors(authors)
    when 7
      Book.add_books(books, genre, authors, labels)
      write_books
      write_genres
      write_authors
      write_labels
    when 8
      MusicAlbum.add_music_album(music_albums, genre, authors, labels)
      write_genres
      write_music_albums
      write_authors
      write_labels
    when 9
      Game.add_games(games, genre, authors, labels)
      write_games
      write_genres
      write_authors
      write_labels
    when 10
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
