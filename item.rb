require 'securerandom'
require_relative 'label'

class Item
  attr_reader :genre, :author, :label, :publish_date, :id
  attr_accessor :archived

  def initialize(publish_date, id = SecureRandom.random_number(1000))
    @publish_date = publish_date
    @archived = false
    @id = id
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    date = publish_date.to_i
    Time.new.year - date >= 10
  end
end
