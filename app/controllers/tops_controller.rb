class TopsController < ApplicationController
  def index
    # @store = Store.all
    # @stores = Store.where('address LIKE(?)', "%#{params[:address]}%")
    # @user = User.all
    @cart = current_cart
    @store1 = Store.find(1)
    # @store2 = Store.find(2)
  end


  def search
    @stores = Store.where('address LIKE(?)', "%#{params[:search]}%")
  end

  def show
    @store = Store.find(params[:id])
  end


end

