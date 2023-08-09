require_relative 'message_outputs'
require_relative 'preserveData/write_data'
require_relative 'preserveData/load_data'
require './models/music_album'
require_relative 'models/game'
require './models/genre'

class App
  include WriteData
  include MessageOutputs
  include LoadData
  attr_accessor :music_albums, :genre, :authors, :games

  def initialize
    @genre = load_genres
    @authors = load_authors
    @music_albums = load_music_albums
    @games = load_games
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
    when 2
      MusicAlbum.list_all_music_albums(music_albums)
    when 3
      Game.list_all_games(games)
    when 4
      Genre.list_all_genres(genre)
    when 6
      Author.list_all_authors(authors)
    when 8
      MusicAlbum.add_music_album(music_albums, genre, authors)
      write_genres
      write_music_albums
      write_authors
    when 9
      Game.add_games(games, genre, authors)
      write_games
      write_genres
      write_authors
    when 10
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
