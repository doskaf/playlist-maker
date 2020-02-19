class PlaylistsController < ApplicationController
    before_action :redirect_if_not_owner, only: [:edit, :update]

    def new
        redirect_to login_path if !logged_in?
        @playlist = Playlist.new
        @song = @playlist.songs.build
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

    def by_category
        @playlists = Playlist.by_category
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

    def redirect_if_not_owner
        redirect_to root_path if !playlist_owner?
    end

    def playlist_params
        params.require(:playlist).permit(:name, :category_name, :song_ids => [])
    end

end