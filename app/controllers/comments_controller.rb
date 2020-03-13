# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @image_info = ImageInfo.find(params[:image_info_id])
    @comment = @image_info.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @image_info, notice: 'Comment is successfully created.'
  end

  def destroy
    @image_info = ImageInfo.find(params[:image_info_id])
    @comment = @image_info.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment successfully destroy'
    redirect_to @image_info
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
