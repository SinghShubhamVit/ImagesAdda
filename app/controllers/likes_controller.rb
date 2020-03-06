class LikesController < ApplicationController
	before_action :find_like, only: [:destroy]
  before action find_image_info
 
 def create
 	  if already_liked?
 	  	flash[:notice] = "you can't like more then once"
 	  else
      @image_info.likes.create(user_id: current_user.id)
    end
    redirect_to image_info_path(@image_info)
  end

  private
  def find_post
    @image_info = ImageInfo.find(params[:image_info_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end




	def destroy
	  if !(already_liked?)
	    flash[:notice] = "Cannot unlike"
	 else
	    @like.destroy
	 end
	  redirect_to image_info_path(@image_info)
	end
end
