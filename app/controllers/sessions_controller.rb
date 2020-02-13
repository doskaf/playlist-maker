class SessionsController < ApplicationController
    
    def new
    end
 
    def create
        @user = User.find_by(username: params[:username])
        if !@user.authenticate(params[:password])
            flash[:alert] = "Incorrect Password."
            render :new
        else
            session[:user_id] = @user.id
            redirect '/categories'
        end
    end

    def destroy
        session.delete :user_id
    end

end