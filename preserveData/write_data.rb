require 'fileutils'
require 'json'

module WriteData
  def write_genres
    json_genre = []
    genre.each do |genre|
      json_genre << { name: genre.name, id: genre.id }
    end

    FileUtils.touch('./storage_data/genre.json')
    File.write('./storage_data/genre.json', JSON.pretty_generate(json_genre))
  end

  def write_music_albums
    json_music_albums = []
    music_albums.each do |music_album|
      new_music_album = {
        publish_date: music_album.publish_date,
        id: music_album.id,
        title: music_album.label.title,
        label_color: music_album.label.color,
        on_spotify: music_album.on_spotify,
        first_name: music_album.author.first_name,
        last_name: music_album.author.last_name,
        genre: music_album.genre.name
      }
      json_music_albums << new_music_album
    end

    FileUtils.touch('./storage_data/music_albums.json')
    File.write('./storage_data/music_albums.json', JSON.pretty_generate(json_music_albums))
  end

  def write_authors
    json_author = []
    authors.each do |author|
      json_author << { first_name: author.first_name, last_name: author.last_name, id: author.id }
    end
    FileUtils.touch('./storage_data/author.json')
    File.write('./storage_data/author.json', JSON.pretty_generate(json_author))
  end

  def write_games
    json_games = []
    games.each do |game|
      new_game = {
        publish_date: game.publish_date,
        id: game.id,
        title: game.label.title,
        label_color: game.label.color,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        first_name: game.author.first_name,
        last_name: game.author.last_name,
        genre: game.genre.name
      }
      json_games << new_game
    end

    FileUtils.touch('./storage_data/games.json')
    File.write('./storage_data/games.json', JSON.pretty_generate(json_games))
  end

  def write_books
    json_books = []
    books.each do |book|
      new_book = {
        publish_date: book.publish_date,
        id: book.id,
        title: book.label.title,
        label_color: book.label.color,
        publisher: book.publisher,
        cover_state: book.cover_state,
        first_name: book.author.first_name,
        last_name: book.author.last_name,
        genre: book.genre.name
      }
      json_books << new_book
    end

    FileUtils.touch('./storage_data/books.json')
    File.write('./storage_data/books.json', JSON.pretty_generate(json_books))
  end

  def write_labels
    json_labels = []
    labels.each do |label|
      json_labels << { label_title: label.title, label_color: label.color, id: label.id }
    end
    FileUtils.touch('./storage_data/labels.json')
    File.write('./storage_data/labels.json', JSON.pretty_generate(json_labels))
  end
end
