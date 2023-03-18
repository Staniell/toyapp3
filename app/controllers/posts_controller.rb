class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
  
    def index
      @posts = Post.order(updated_at: :desc)
    end
  
    def show
    end
  
    def new 
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.valid? && @post.save
        redirect_to posts_path
      else
        flash[:alert] = "Title must be between 3 and 20 characters. Content must be between 5 and 30 characters."
        redirect_to new_post_path
      end
    end

  
    def edit
    end
  
    def update
      if @post.update(post_params) && @post.valid?
        redirect_to posts_path
      else
        flash[:alert] = "Title and body must be between 5 and 30 characters."
        redirect_to edit_post_path
      end
    end
  
    def destroy
      @post.destroy
      @post.taggings.destroy_all 
      redirect_to posts_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body, :user_id, tag_ids: [], images:[])
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def authorize_user!
      unless @post.user == current_user
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to posts_path
      end
    end
  end
  