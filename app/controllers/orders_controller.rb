class OrdersController < ApplicationController

  def index
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @event = params[:event_id]
    @ticket = Ticket.create!(order_params)
    @order = current_user.orders.build
    redirect_back(fallback_location: @order)
  end

  private

  def order_params
    params.require(:order).permit(tickets_attributes:[:ticket_type_id, :quantity, :event_id])
  end
end
