class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]

    def index 
        @comments = Comment.order("UPDATED_at DESC")
    end

    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            # error
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to @comment.post, notice: "Comment updated successfully."
        else
            redirect_to post_path,  alert: "Error creating comment."
        end
        
    end

    def destroy
        @comment.destroy
        redirect_to @comment.post, notice: "Comment deleted successfully."
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end
    # strong params
    def comment_params
        # params.require(:comment).permit(:body, :post_id).merge(user_id: current_user.id)
        params.require(:comment).permit(:post_id, :user_id, :body)
    end

end
