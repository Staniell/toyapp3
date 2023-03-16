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
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        @post.images.attach(params[:new_images])
        redirect_to posts_path
        # binding.pry
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      @post.taggings.destroy_all 
      redirect_to posts_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body, tag_ids: [], images:[])
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
  