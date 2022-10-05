class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.destination_name
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.name = Address.find(params[:order][:address_id]).name
      @order.address = Address.find(params[:order][:address_id]).address
    elsif params[:order][:address_number] == "3"
      current_customer.addresses.new(address_params)
    end
    @order.shipping_cost = "800"
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.total_payment = @total + @order.shipping_cost
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method )
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name )
  end

end
