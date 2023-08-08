require 'fileutils'
require 'json'

module WriteData
    def write_genres
        json_genre = []
        genre.each do |genre|
          json_genre << { name: genre.name, id: genre.id }
        end
    
        FileUtils.touch('./storage_data/genre.json')
        File.write('./storage_data/genre.json', JSON.pretty_generate(json_genre))    
    end
end
