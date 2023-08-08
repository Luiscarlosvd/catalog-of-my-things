require_relative '../item'
require_relative 'author'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id = SecureRandom.random_number(1000))
    super(publish_date, id)
    @on_spotify = false
  end

  def self.list_all_music_albums(music_albums)
    print music_albums
    if music_albums.empty?
      puts 'No Music Albums found'
    else
      music_albums.each_with_index do |music_album, index|
        puts "#{index}) Author: #{music_album.author.first_name} #{music_album.author.last_name}, Genre: #{music_album.genre.name}, Publish Date: #{music_album.publish_date}"
      end
      puts
    end
  end

  def self.add_music_album(music_albums, genre, authors)
    print 'First Name of the author: '
    first_name = gets.chomp.capitalize
    print 'Last Name of the author: '
    last_name = gets.chomp.capitalize
    print 'Genre of the music album: '
    name_genre = gets.chomp.capitalize
    print 'Publish Date [YYYY/MM/DD]: '
    publish_date = gets.chomp

    new_author = authors.find { |find_author| find_author.first_name == first_name && find_author.last_name == last_name }

    new_genre = genre.find { |find_genre| find_genre.name == name_genre }

    new_music_album = MusicAlbum.new(publish_date)

    if new_genre.nil?
      new_genre = Genre.new(name_genre)
      genre << new_genre
    end

    if new_author.nil?
      new_author = Author.new(first_name, last_name)
      authors << new_author
    end

    new_genre.add_item(new_music_album)
    new_author.add_item(new_music_album)

    music_albums << new_music_album
    puts 'Your music album has been created successfully'
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
