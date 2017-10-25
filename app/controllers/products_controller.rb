class ProductsController < ApplicationController

  def index
    @cart_item = current_cart.cart_items.new
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  def show
    @product = Product.find(params[:id])
    @item = CartItem.new
  end

  # def add_to_cart
  #   product = Product.find(params[:id])
  #   @cart = find_cart
  #   @cart.add_product(product)
  # end

  private
  def product_params
    params.require(:product).permit(:name, :price, :detail, :image, :category, :stock, :store_id)
  end
end
