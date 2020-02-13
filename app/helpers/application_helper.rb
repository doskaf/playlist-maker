module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(:id => session[:id]) if session[:id]
    end

    def logged_in?
        !!current_user
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
