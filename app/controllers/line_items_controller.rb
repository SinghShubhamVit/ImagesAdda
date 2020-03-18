# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: %i[show edit update destroy]

  def index
    @line_items = LineItems.all
  end

  def new
    @line_item = LineItem.new
  end

  def create
    image_info = ImageInfo.find(params[:image_info_id])
    @line_item = @cart.add_image_info(image_info)

    if @line_item.save
      redirect_to @line_item.cart
    else
      render new
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'item Added to cart.'
    else
      render :edit
    end
  end

  def destroy
    @line_item.destroy
    redirect_to @line_item.cart, notice: 'Line item was successfully destroyed.'
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:image_info_id)
  end
end
