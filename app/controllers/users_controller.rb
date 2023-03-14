class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show 
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.posts.destroy_all
        # @user.comments.destroy_all
        @user.destroy
        redirect_to posts_path
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
