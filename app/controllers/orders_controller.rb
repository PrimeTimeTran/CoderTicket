class OrdersController < ApplicationController
  before_action :sanitize_page_params

  def index
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @ticket = Ticket.create!(order_params)
    @order = current_user.orders.build
    redirect_back(fallback_location: @order)
  end

  private
  def sanitize_page_params
    params[:quantity] = params[:quantity].to_i
  end

  def order_params
    params.require(:order).permit(tickets_attributes:[:ticket_type_id, :quantity, :event_id])
  end
end
