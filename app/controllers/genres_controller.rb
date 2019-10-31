class GenresController < ApplicationController
    get "/genres" do
        @genres = Genre.all
        erb :"/genres/index"
    end

    get "/genres/:slug" do
        @genre = Genre.find_by_slug(params[:slug])
        @songs = @genre.find_songs
        @artists = @genre.find_artists
        

        erb :"/genres/show"
    end
end