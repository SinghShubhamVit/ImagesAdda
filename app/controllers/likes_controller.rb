# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]

  def create
    @image_info = ImageInfo.find(params[:image_info_id])
    if already_liked?
      flash[:notice] = "you can't like more then once"
    else
      @image_info.likes.create(user_id: current_user.id)
    end
    redirect_to image_infos_path
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end
    redirect_to image_infos_path
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, image_info_id: params[:image_info_id]).exists?
  end

  def find_like
    @image_info = ImageInfo.find(params[:image_info_id])
    @like = @image_info.likes.find(params[:id])
  end
end
