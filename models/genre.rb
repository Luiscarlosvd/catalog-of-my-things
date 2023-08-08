require 'securerandom'
require_relative '../item'

class Genre
  attr_reader :name, :id
  attr_accessor :items

  def initialize(name, _id = SecureRandom.random_number(1000))
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def self.list_all_genres(genres)
    if genres.empty?
      puts 'No Music Albums found'
    else
      filtered_genres = []
      genres.each do |genre|
        filtered_genres << genre unless filtered_genres.any? { |g| g.name == genre.name }
      end

      filtered_genres.each_with_index do |genre, index|
        puts "#{index}) Genre: #{genre.name}"
      end
      puts
    end
  end
end
