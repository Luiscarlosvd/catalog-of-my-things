require './book'

class Label < Book
  attr_accessor :id, :title, :color, :item

  def initialize(id, title, color, item)
    @id = Random.rand(1..100_000)
    @title = title
    @color = color
    @item = []
  end

  def add_item(item)
    # Add the item to the collection
    @items << item

    # Set the label as a property of the item
    item.label = self
  end

end