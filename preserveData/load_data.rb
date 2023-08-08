require 'json'
require './models/genre.rb'

module LoadData
    def load_genres
        genres_arr = []
        if File.exist?('./storage_data/genre.json')
          genres_data = File.read('./storage_data/genre.json')
          if genres_data != ''
            JSON.parse(genres_data).map do |genre|
                new_genre = Genre.new(genre['name'])
                new_genre.id = genre['id']
                genres_arr << new_genre
            end
          end
        end
        genres_arr
    end
end