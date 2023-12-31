require_relative '../item'
require_relative 'author'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id

  def initialize(publish_date, id = SecureRandom.random_number(1000))
    super(publish_date, id)
    @on_spotify = false
  end

  def self.list_all_music_albums(music_albums)
    if music_albums.empty?
      puts 'No Music Albums found'
    else
      puts 'List of All Music Albums: '
      music_albums.each_with_index do |album, index|
        puts "#{index}) (ID:#{album.id}) Title: #{album.label.title}, Author: #{album.author.first_name} #{album.author.last_name}, Genre: #{album.genre.name}, Publish Date: #{album.publish_date}"
      end
      puts
    end
  end

  def self.add_music_album(music_albums, genre, authors, labels)
    print 'Enter name of the music album: '
    label_title = gets.chomp.capitalize
    print 'First Name of the author: '
    first_name = gets.chomp.capitalize
    print 'Last Name of the author: '
    last_name = gets.chomp.capitalize
    print 'Genre of the music album: '
    name_genre = gets.chomp.capitalize
    print 'Enter the music album\'s color: '
    label_color = gets.chomp
    print 'Publish Date [YYYY/MM/DD]: '
    publish_date = gets.chomp

    new_author = authors.find { |find_author| find_author.first_name == first_name && find_author.last_name == last_name }
    new_label = labels.find { |find_label| find_label.title == label_title && find_label.color == label_color }
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

    if new_label.nil?
      new_label = Label.new(label_title, label_color)
      labels << new_label
    end

    new_genre.add_item(new_music_album)
    new_author.add_item(new_music_album)
    new_label.add_item(new_music_album)

    music_albums << new_music_album
    puts 'Your music album has been created successfully'
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
