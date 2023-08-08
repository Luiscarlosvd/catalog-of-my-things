class Book
  attr_reader :publisher_date
  attr_accessor :publisher, :age, :cover_state

  def initialize (publisher, age, cover_state, publisher_date: true)
    super()
    @publisher = publisher
    @age = age
    @cover_state = cover_state
    @publisher_date = publisher_date
  end

  def can_be_achieved?
    publisher_date? || @cover_state == "bad"
  end

  def publisher_date?
    @age >= 10
  end
end