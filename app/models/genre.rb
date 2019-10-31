class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
    def slug
        name_string = self.name
        name_string_downcase = name_string.downcase
        name_array_split = name_string_downcase.split(" ")
        name_array_joined = name_array_split.join("-")
        name_array_joined
    end

    def self.find_by_slug(slug)
        Genre.all.find {|genre| genre.slug == slug}
    end

    def find_songs
        song_genre = SongGenre.all.select {|songgenre| songgenre.genre_id == self.id }
        song_ids = song_genre.map {|songgenre| songgenre.song_id}
        songs = Song.all.select {|song| song_ids.include?(song.id)}
    end

    def find_artists
        songs = self.find_songs
        artists = songs.map {|song| song.artist}
    end

end
