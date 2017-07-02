class TicketsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @ticket = Ticket.new
    @event = Event.find(params[:event_id])
    @order = current_user.orders.build
    @order.tickets = @event.ticket_types.map { |e| Ticket.new(event_id: @event.id, ticket_type_id: e.id, name: e.name, price: e.price, quantity: e.max_quantity)  }
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = "Tickets purchased. Thank You!"
      redirect_to root_path
    else
      flash[:error] = "Cannot purchase ticket: #{@ticket.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
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
    params.require(:ticket).permit(:quantity, :ticket_type_id)
  end
end
