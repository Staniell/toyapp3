class AdminController < ApplicationController
    def index
        @post_count = Post.count
        @comment_count = Comment.count
        @tag_count = Tag.count
        @user_count = User.count
    end

    def create_tag
        @tag_count = Tag.count
        if @tag_count < 5
            @new_tag = Tag.new(name: params[:name])
            @new_tag.save
            redirect_to "/admin/new_tag"
        else
            flash[:alert] = "You cannot create more than 5 tags."
            redirect_to "/admin/new_tag"
            # render :index
        end
    end

    def new_tag
        @tags = Tag.all
        @new_tag = Tag.new
    end

    def comment_check
        @comments = Comment.all
    end

    def user_check
        @users = User.all.includes(:posts, :comments) # solves n+1 prob
    end

    def post_by_user
        @user = User.find(params[:id])
        @posts = @user.posts
    end


    def destroy_user
        @user = User.find(params[:id])
        @user.posts.destroy_all # FK constraint
        @user.destroy
        redirect_to "/admin/user_check"
    end

    def post_check
        @posts = Post.all
    end

    def destroy_comment
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to "/admin/comment_check"
    end

    def destroy_post
        @post = Post.find(params[:id])
        @post.destroy
        redirect_back(fallback_location: root_path)
    end

    def edit_tag
        @old_tag = Tag.find(params[:id])
    end

    def update_tag
        @tag = Tag.find(params[:id])
        if @tag.update(name: params[:name])
            redirect_to "/admin/new_tag"
        end
    end

    def destroy_tag
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to "/admin/new_tag"
    end

    def testing 
        @comment_counts = Comment.count
    end

    private

    # def tag_params
    #     params.require(:tag).permit(:name)
    #   end
    
end
