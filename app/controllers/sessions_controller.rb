class SessionsController < ApplicationController
    
    def new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to '/categories'
        else
            flash[:alert] = "Incorrect Password."
            render :new
        end
    end

    def destroy
        session.delete :id
        redirect_to '/'
    end

end