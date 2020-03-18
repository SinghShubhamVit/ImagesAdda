# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: %i[show edit update destroy checkout]
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
    @carts = Cart.eager_load(:line_items).where(user_id: current_user.id)
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    redirect_to cart_path(@cart), notice: 'Your cart is currently empty !'
  end

  def checkout
    @cart.update(status: true)
    session[:cart_id] = nil
    redirect_to root_path, notice: 'Your order is placed !'
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
    redirect_to root_path, notice: "that cart doesn't exist"
  end
end
