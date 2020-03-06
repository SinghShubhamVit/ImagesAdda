class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@image_info = ImageInfo.find(params[:image_info_id])
		@comment = @image_info.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to_image_info_path(@image_info)
	end

	def destroy
		@image_info = ImageInfo.find(params[:image_info_id])
		@comment = @image_info.comments.find(params[:id])
		@comment.destroy
		redirect_to_image_info_path(@image_info)
	end

	private

	def set_imageinfo
		@imageinfo = ImageInfo.find(params[:id])


	def comment_params
	 	params.require(:comment).permit(:content)
  end
end
