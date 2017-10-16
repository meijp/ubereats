class TopsController < ApplicationController
  def index
  @stores = Store.search(params[:search])
  end


  def search
    @stores = Store.where('address LIKE(?)', "%#{params[:address]}%")
  end


  def show
    @store = Store.find(params[:id])
  end


end

