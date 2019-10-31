class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
   
    def slug
        name_string = self.name
        name_string_downcase = name_string.downcase
        name_array_split = name_string_downcase.split(" ")
        name_array_joined = name_array_split.join("-")
        name_array_joined
    end

    def self.find_by_slug(slug)
        Song.all.find {|song| song.slug == slug}
    end

    def find_artist
        Artist.all.find(self.artist_id)
    end

    def find_genre
        song_genre = SongGenre.all.find(self.id)
        genre_id = song_genre.genre_id
        genre = Genre.all.find(genre_id)
    end
    
end
