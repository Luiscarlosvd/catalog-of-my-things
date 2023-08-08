require_relative 'message_outputs'
require './models/music_album'

class App
  include MessageOutputs
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
    when 8
      MusicAlbum.add_music_album(music_albums, genre, authors)
    when 10
     when 16
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
