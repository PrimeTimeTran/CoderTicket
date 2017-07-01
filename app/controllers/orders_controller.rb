class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @ticket = Ticket.create(order_params)
    @order = Order.new(order_params)
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :address, :ticket_type_id, :quantity)
  end
end
