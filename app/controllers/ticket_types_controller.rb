class TicketTypesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def destroy
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_type = TicketType.create(ticket_type_params)
    @ticket_type.event_id = @event.id
    @ticket_type.save
    redirect_to root_path
  end

  private
  def ticket_type_params
    params.require(:ticket_type).permit(:event_id, :quantity, :name, :price, :max_quantity)
  end
end
