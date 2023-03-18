class ImagesController < ApplicationController
    before_action :set_image_post, except: [:index]

    def index
        # @images = ActiveStorage::Attachment.all.map(&:blob)
        @images = ActiveStorage::Attachment.order('RANDOM()').limit(10)
        @images2 = ActiveStorage::Attachment.where.not(id: @images.pluck(:id)).order('RANDOM()').limit(10)

    end

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
