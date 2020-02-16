class UsersController < ApplicationController

    def new
        @user = User.new
        @playlist = @user.playlists.build
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        render :'/page_not_found' if @user.nil?
    end

    def edit
        @user = User.find_by_id(params[:id])
        render :'/page_not_found' if current_user != User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        @user.update(user_params)
        @user.save ? (redirect_to @user) : (render :edit)
    end

    def destroy
        @user = User.find_by_id(params[:id])
        @user.destroy
        flash[:notice] = "User deleted."
        redirect_to "/"
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :playlists_attributes => [:name, :category])
    end

end