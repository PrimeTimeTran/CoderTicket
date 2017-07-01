class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    @order.event = Event.find(params[:event_id])
  end

  private
  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end
end
