class TicketsController < ApplicationController
  def index
  end

  def new
    @event = Event.find(params[:event_id])
  end
end
