class CommentsController < ApplicationController
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

    private 
    # strong params
    def comment_params
        params.require(:comment).permit(:body)
    end

end
