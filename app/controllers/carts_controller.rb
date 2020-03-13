# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    @carts = Cart.all
  end

  def show; end

  def new
    @cart = Cart.new
  end

  def create
    if @cart.save
      redirect_to @cart, notice: 'Cart was successfully created.'
      render :show, status: :created, location: @cart
    else
      redirect_to @Cart
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Cart was successfully updated.'
      render :show, status: :ok, location: @cart
    else
      render :edit

    end
  end

  def your_carts
    @carts = Cart.where(user_id: current_user.id)
    @line_items_of_carts = LineItem.where(cart_id: @carts.ids)
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    redirect_to '/', notice: 'Your cart is currently empty !'
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to '/', notice: 'Invalid cart'
  end
end
