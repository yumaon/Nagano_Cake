class Admin::HomesController < ApplicationController
  def top
    if params[:name].present?
      @orders = Customer.find(params[:name]).orders
      @list_name = Customer.find(params[:name]).name_display + "さんの注文履歴"
    else
      @orders = Order.all
      @list_name = "注文履歴一覧"
    end
  end
end
