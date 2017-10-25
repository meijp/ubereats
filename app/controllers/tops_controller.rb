class TopsController < ApplicationController
  def index
    # @store = Store.all
    # @stores = Store.where('address LIKE(?)', "%#{params[:address]}%")
    # @user = User.all
  end


  def search
    # @stores = Store.all
    # @stores = Store.where('address LIKE(?)', "%#{params[:address]}%")
    @stores = Store.where('address LIKE(?)', "%#{params[:search]}%") #paramsとして送られてきたkeyword（入力された語句）で、Userモデルのnameカラムを検索し、その結果を@usersに代入する
        # respond_to do |format|
        #   format.json { render 'index', json: @stores } #json形式のデータを受け取ったら、@usersをデータとして返す そしてindexをrenderで表示する
        # end
  end

  def show
    @store = Store.find(params[:id])
  end


end

