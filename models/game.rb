require_relative '../item'
require_relative 'author'
require_relative 'genre'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.list_all_games(games)
    index = 1
    if games.empty?
      puts 'No Games found'
    else
      puts 'List of all games: '
      games.each do |game|
        if game.instance_of? Game
          puts "#{index}) (ID:#{game.id}) The game: game.label , Author: #{game.author.first_name} #{game.author.last_name}, Genre: #{game.genre.name}, Publish Date: #{game.publish_date}"
          index += 1
        end
      end
    end
  end

  def self.add_games(games, genre, authors)
    # print 'Enter name of the game: '
    # label_title = gets.chomp
    print 'Games\'s creator first name: '
    author_first_name = gets.chomp
    print 'Game\'s creator last name: '
    author_last_name = gets.chomp
    print 'Enter the game\'s genre: '
    genre_name = gets.chomp

    # item inputs
    print "\nWhat's the publish date? [year] "
    print "\nAnswer: "
    game_date = gets.chomp.to_i
    print 'Is it a multiplayer game? [y/n]'
    print "\nAnswer: "
    game_multiplayer = gets.chomp
    multiplayer_answer = case game_multiplayer.downcase
                         when 'y'
                           true
                         else
                           false
                         end
    print 'When was the game last played?'
    print "\nAnswer: "
    last_played = gets.chomp.to_i

    new_game = Game.new(multiplayer_answer, last_played, game_date)

    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_game)

    # new_label = Label.new(label_title, 'unknown')
    # new_label.add_item(new_game)

    new_genre = Genre.new(genre_name)
    new_genre.add_item(new_game)

    # new_game

    new_author = authors.find { |find_author| find_author.first_name == author_first_name && find_author.last_name == author_last_name }

    new_genre = genre.find { |find_genre| find_genre.name == genre_name }

    if new_genre.nil?
      new_genre = Genre.new(genre_name)
      genre << new_genre
    end

    if new_author.nil?
      new_author = Author.new(author_first_name, author_last_name)
      authors << new_author
    end

    new_genre.add_item(new_game)
    new_author.add_item(new_game)

    games << new_game
    puts 'Your game has been created successfully'
  end

  private

  def can_be_archived?
    super && Time.new.year - last_played_at > 2
  end
end
