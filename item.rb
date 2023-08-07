require 'securerandom'

class Item
  attr_reader :genre, :author, :label, :publish_date, :archived, :id

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


end
