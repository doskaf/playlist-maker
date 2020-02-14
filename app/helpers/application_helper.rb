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

    def authenticate
        redirect "/login" if !logged_in?
    end

    def login(username, password)
        user = User.find_by(:username => username)
        if  user && user.authenticate(password)
            session[:id] = user.id
        else
            redirect '/login'
        end
    end

end
