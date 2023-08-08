require_relative 'message_outputs'
require './models/music_album'
require_relative 'models/game'
require './models/genre'

class App
  include MessageOutputs
  attr_accessor :music_albums, :genre, :authors

  def initialize
    @music_albums = []
    @genre = []
    @authors = []
    @games = []
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
      Game.list_games(games)
    when 6
      Author.list_authors(authors)
    when 8
      MusicAlbum.add_music_album(music_albums, genre, authors)
    when 9
      @games << Game.add_game
    when 10
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
