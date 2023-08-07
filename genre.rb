require 'securerandom'
require './item'

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
end
