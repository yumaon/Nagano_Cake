class Public::ItemsController < ApplicationController
  def search
    @items = Item.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    @item = @items
    @genres = Genre.all
    @list_name = "商品一覧"
    render "index"
  end

  def index
    @genres = Genre.all
    if params[:name].present?
      @items = Genre.find(params[:name]).items.page(params[:page])
      @list_name = Genre.find(params[:name]).name + "一覧"
    else
      @items = Item.page(params[:page])
      @list_name = "商品一覧"
    end

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end
end
