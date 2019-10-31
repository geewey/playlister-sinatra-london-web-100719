class SongsController < ApplicationController
    get "/songs" do
        @songs = Song.all
        erb :"/songs/index"
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        @song_artist = @song.find_artist
        @song_artist_name = @song.find_artist.name
        erb :"/songs/show"
    end
end
