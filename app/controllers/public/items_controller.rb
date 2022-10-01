class Public::ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.page(params[:page])
  end

  def show
  end
end
