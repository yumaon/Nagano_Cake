class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:name].present?
      @orders = Customer.find(params[:name]).orders.page(params[:page]).per(10)
      @list_name = Customer.find(params[:name]).name_display + "さんの注文履歴"
    else
      @orders = Order.page(params[:page]).per(10)
      @list_name = "注文履歴一覧"
    end
  end
end
