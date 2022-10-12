class Admin::HomesController < ApplicationController
  def top
    if params[:email].present?
      @orders = Customer.find(params[:email]).orders
      @list_name = Customer.find(params[:email]).name_display + "さんの注文履歴"
    else
      @orders = Order.all
      @list_name = "注文履歴一覧"
    end
  end
end
