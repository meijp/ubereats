class TopsController < ApplicationController
  def index
    # @store = Store.all
    # @stores = Store.where('address LIKE(?)', "%#{params[:address]}%")
    # @user = User.all
    @cart = current_cart
  end


  def search
    @stores = Store.where('address LIKE(?)', "%#{params[:search]}%")
  end

  def show
    @store = Store.find(params[:id])
  end


end

