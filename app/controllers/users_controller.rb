class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :set_image_info, only: [:edit, :update]

 def index
 	@users = User.all
 end
 

	def show
		@users = User.find(params[:id])
		@image_info = ImageInfo.where(user_id: @users.id) 
	 end

 def destroy
 	@user = User.find(params[:id])
 	@user.destroy
 	redirect_to users_path
 end

 	def your_uploads
 		@image = ImageInfo.where(user_id: current_user.id)
 	end
 private
  def set_imageinfo
	   @imageinfo = ImageInfo.find(params[:id])
	 end


end
