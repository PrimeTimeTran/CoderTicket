class TicketsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @order = Order.new(event: @event)
  end

  def create
    @event = Event.find(params[:event_id])
    @order = Order.new(ticket_params)
    if @order.tickets.any?
      @order.save
      flash[:success] = "Tickets have been purchase successfully"
      redirect_to event_path(@event)
    else
      flash[:error] = "Ticket number should be greater than 0"
      redirect_back(fallback_location: event_path(@event))
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  def ticket_params
    params.require(:order).permit(tickets_attributes: [:quantity, :ticket_type_id, :order_id])
  end
end
