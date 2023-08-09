require 'json'
require './models/genre'
require './models/music_album'
require './models/author'

module LoadData
  def load_genres
    genres_arr = []
    if File.exist?('./storage_data/genre.json')
      genres_data = File.read('./storage_data/genre.json')
      if genres_data != ''
        JSON.parse(genres_data).map do |genre|
          new_genre = Genre.new(genre['name'])
          new_genre.id = genre['id']
          genres_arr << new_genre
        end
      end
    end
    genres_arr
  end

  def load_music_albums
    music_album_arr = []
    if File.exist?('./storage_data/music_albums.json')
      music_album_data = File.read('./storage_data/music_albums.json')
      if music_album_data != ''
        JSON.parse(music_album_data).map do |music_album|
          new_music_album = MusicAlbum.new(music_album['publish_date'])
          new_music_album.id = music_album['id']
          new_music_album.on_spotify = music_album['on_spotify']
          ## new_author = authors.find { |find_author| find_author.first_name == music_album['first_name'] && find_author.last_name == music_album['last_name'] }
          new_author = Author.new(music_album['first_name'], music_album['last_name'])
          new_genre = genre.find { |find_genre| find_genre.name == music_album['genre'] }

          new_genre.add_item(new_music_album)
          new_author.add_item(new_music_album)

          music_album_arr << new_music_album
        end
      end
    end
    music_album_arr
  end

  def load_authors
    authors_arr = []
    if File.exist?('./storage_data/author.json')
      authors_data = File.read('./storage_data/author.json')
      if authors_data != ''
        JSON.parse(authors_data).map do |author|
          new_author = Author.new(author['first_name'], author['last_name'], author['id'])
          authors_arr << new_author
        end
      end
    end
    authors_arr
  end
end
