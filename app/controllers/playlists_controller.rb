class PlaylistsController < ApplicationController

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
        if @playlist.save
            redirect_to @playlist
        else
            render :new
        end
    end

    def show
        @playlist = Playlist.find_by_id(params[:id])
    end

    def edit
        @playlist = Playlist.find_by_id(params[:id])
    end

    def update
        @playlist = Playlist.find_by_id(params[:id])
        @playlist.update(playlist_params)
        @playlist.save ? (redirect_to @playlist) : (render :edit)
    end

    def destroy
        @playlist = Playlist.find_by_id(params[:id])
        @playlist.destroy
        flash[:notice] = "Playlist deleted."
        redirect_to "/"
    end

    private

    def playlist_params
        params.require(:playlist).permit(:name)
    end

end