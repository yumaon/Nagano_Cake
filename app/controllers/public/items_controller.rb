class Public::ItemsController < ApplicationController
  def search
    @items = Item.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    @item = @items
    render "index"
  end

  def index
    @item = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
end
