class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        name_string = self.name
        name_string_downcase = name_string.downcase
        name_array_split = name_string_downcase.split(" ")
        name_array_joined = name_array_split.join("-")
        name_array_joined
    end

    def self.find_by_slug(slug)
        Artist.all.find {|artist| artist.slug == slug}
    end

    def find_song
        Song.all.select {|song| song.artist_id == self.id}
    end
    
end