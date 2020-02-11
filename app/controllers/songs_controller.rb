class SongsController < ApplicationController

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find_by_id(params[:id])
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist)
    end

end