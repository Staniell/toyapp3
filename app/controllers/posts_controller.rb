class PostsController < ApplicationController
    
    def index
        @posts = Post.order("UPDATED_at DESC")
    end

    def new 
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            # render form again
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            # render if fail
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.taggings.destroy_all
        if @post.destroy
            redirect_to posts_path
        else
            # rerender
        end
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :body, :tag_ids => [])
    end
end
