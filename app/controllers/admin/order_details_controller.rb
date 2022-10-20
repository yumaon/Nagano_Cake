class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_details = OrderDetail.find(params[:id])
    if @order_details.update(order_detail_params)
      @order.update(status: 2) if @order_details.making_status == "in_production"
      @order.update(status: 3) if @order_details.making_status == "production_complete"
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
