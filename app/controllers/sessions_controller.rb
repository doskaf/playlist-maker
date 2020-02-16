class SessionsController < ApplicationController
    
    def new
    end
 
    def create
        if params[:username]
            @user = User.find_by(username: params[:username]) if params[:username]
            if @user && @user.authenticate(params[:password])
                session[:id] = @user.id
                redirect_to '/categories'
            else
                flash[:alert] = "Incorrect Password."
                render :new
            end
        else
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
            end
            session[:user_id] = @user.id
            redirect_to '/categories'
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