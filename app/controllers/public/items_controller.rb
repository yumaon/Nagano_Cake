class Public::ItemsController < ApplicationController
  def search
    @items = Item.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    @item = @items
    @genres = Genre.all
    render "index"
  end

  def index
    @genres = Genre.all
    if params[:name].present?
      @items = Genre.find(params[:name]).items.page(params[:page])
      @list_name = Genre.find(params[:name]).name
    else
      @items = Item.page(params[:page])
      @list_name = "商品"
    end

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
end
