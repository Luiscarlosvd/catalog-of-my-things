class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (Date.today - @last_played_at).to_i >= 365 * 2
  end
end
