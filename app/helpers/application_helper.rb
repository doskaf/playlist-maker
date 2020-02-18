module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(:id => session[:id]) if session[:id]
    end

    def logged_in?
        !!current_user
    end

    def correct_user?
        (logged_in?) && (current_user == User.find_by_id(params[:id]))
    end

    def playlist_owner?
        (logged_in?) && (current_user == Playlist.find_by_id(params[:id]).user)
    end

end
