require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = SecureRandom.random_number(1000))
    super(publish_date, id)
    @on_spotify = false
  end

  def self.list_all_music_albums
    if music_albums.empty?
      puts 'No Music Albums found'
    else
      music_albums.each_with_index { |music_album, index| puts "#{index}) Publish Date: #{music_album.publish_date}" }
      puts
    end
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
