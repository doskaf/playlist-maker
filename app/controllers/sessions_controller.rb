class SessionsController < ApplicationController
    
    def new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            oauth_nickname = request.env["omniauth.auth"]["info"]["nickname"]
            if @user = User.find_by(:username => oauth_nickname)
                session[:id] = @user.id
                redirect_to '/'
            else
                @user = User.new(:username => oauth_nickname, :password => SecureRandom.hex)
                if @user.save
                    session[:id] = @user.id
                    redirect_to '/'
                else
                    raise @user.errors.full_messages.inspect
                end
            end
        else
            @user = User.find_by(username: params[:username]) if params[:username]
            if @user && @user.authenticate(params[:password])
                session[:id] = @user.id
                redirect_to '/'
            else
                flash[:alert] = "Incorrect Password."
                render :new
            end
        end
    end

    def destroy
        session.delete :id
        redirect_to '/'
    end

    private
 
  def auth
    request.env['omniauth.auth']
  end

end