require_relative './item.rb'

class MusicAlbum < Item
    attr_accessor :on_spotify

    def initialize(publish_date, id = SecureRandom.random_number(1000))
        super(publish_date, id)
        @on_spotify = false
    end

    private
    def can_be_archived?
        super && @on_spotify
    end
end