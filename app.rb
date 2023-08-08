require_relative 'message_outputs'
require './models/music_album.rb'

class App
  include MessageOutputs
  attr_accessor :music_albums

  def initialize
    @music_albums = []
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
    # Complete the choices
    when 2
      MusicAlbum.list_all_music_albums
    when 10
      goodbye
      exit
    else
      puts 'Invalid number: Please enter a valid number'
    end
  end
end
