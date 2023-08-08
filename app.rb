require_relative 'message_outputs'
require_relative './preserveData/write_data.rb'
require_relative './preserveData/load_data.rb'
require './models/music_album'
require './models/genre'

class App
  include MessageOutputs, WriteData
  attr_accessor :music_albums, :genre, :authors

  def initialize
    @music_albums = []
    @genre = []
    @authors = []
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
    when 4
      Genre.list_all_genres(genre)
    when 8
      MusicAlbum.add_music_album(music_albums, genre, authors)
      write_genres
    when 10
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
