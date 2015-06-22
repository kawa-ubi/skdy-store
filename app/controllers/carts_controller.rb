class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_customer!

  respond_to :html

  def index
    @carts = Cart.list current_customer.id
    @total = Cart.total current_customer.id
    respond_with(@carts)
  end

  def show
    respond_with(@cart)
  end

  def new
    @cart = Cart.new
    respond_with(@cart)
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    redirect_to controller: 'carts', action: 'index'
  end

  def update
    @cart.update(cart_params)
    respond_with(@cart)
  end

  def destroy
    @cart.destroy
    respond_with(@cart)
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:book_id, :customer_id, :quantity)
    end
end
