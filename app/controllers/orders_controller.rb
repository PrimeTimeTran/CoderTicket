class OrdersController < ApplicationController

  def index
  end

  def new
    @order = current_user.orders.build
    @tickets = TicketType.where(event_id: params[:id])
  end

  def create
    @order = current_user.orders.build(order_params)
    @event = params[:event_id]
    @tickets = params[:order][:ticket].each do
      @ticket = Ticket.create!(ticket_type_id: :ticket_type_id, quantity: :quantity)
      @ticket.save
    end
    @order = current_user.orders.build
    redirect_back(fallback_location: @order)
  end

  private

  def order_params
    params.require(:order).permit(ticket_attributes:[:ticket_type_id, :quantity, :event_id])
  end
end
