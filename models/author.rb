require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name, id = SecureRandom.random_number(1000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end
end
