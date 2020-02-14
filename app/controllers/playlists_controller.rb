class PlaylistsController < ApplicationController

    def new
        @playlist = Playlist.new
    end

    def create
        @playlist = Playlist.new(playlist_params)
        @playlist.user_id = current_user.id
        if @playlist.save
            redirect_to @playlist
        else
            render :new
        end
    end

    def index
        if params[:user_id]
            @playlists = User.find(params[:user_id]).playlists
        else
            @playlists = Playlist.all
        end
    end

    def show
        @playlist = Playlist.find_by_id(params[:id])
        render :'/page_not_found' if @playlist.nil?
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
        params.require(:playlist).permit(:name, :category_name)
    end

end