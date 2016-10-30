class TicketsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @ticket = Ticket.new
    @event = Event.find(params[:event_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = "Tickets purchased. Thank You!"
      redirect_to root_path
    else
      flash[:error] = "Error! Please try again."
      render 'new'
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
    params.require(:ticket).permit(:name, :price, :event_id, :quantity, :ticket_type_id)
  end
end
