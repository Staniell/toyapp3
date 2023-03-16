class ImagesController < ApplicationController
    before_action :set_image_post

    def destroy
        @image.purge

        redirect_to posts_path
    end

    def edit
    end

    def update
        @image.purge # Remove old image
    
        new_image = params[:attachment][:image]
        @post.images.attach(new_image)

        redirect_to posts_path
    end

    private

    def set_image_post
        @post = Post.find(params[:post_id])
        @image = @post.images.find(params[:id])
    end

end
