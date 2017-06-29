class EventsController < ApplicationController
#   before_action :require_login, only: [:new, :edit, :update, :publish]

  def index
    if params[:search]
      @events = Event.where(['name ILIKE ?', "%#{params[:search]}%"])
    else
      @events = Event.upcoming
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @venues = Venue.all
  end

  def create
    @event = Event.new event_params
    @event.user_id = current_user.id
      if @event.save
        flash[:success] = "Event created successfully"
        redirect_to root_path
      else
        flash[:error] = "Error - Can't create event"
        render 'new'
      end
  end

  def edit
    @event = Event.find(params[:id])
    @ticket_type = TicketType.new(event: @event)
    unless current_user.id == @event.user_id
      flash[:error] = 'You must be the creator to edit this event'
      redirect_to event_path(@event)
    end
  end

  def update
    @event = Event.find(params[:id])
     if current_user.id != @event.user_id
       flash[:error] = 'You must be the creator to edit this event'
       redirect_to event_path(@event)
     else @event.update(event_params)
       flash[:notice] = 'Event updated'
       redirect_to event_path(@event)
     end
  end

  def publish
    @event = Event.find(params[:id])
    if @event.ticket_types.empty?
      flash[:error] = 'Must create tickets for the venue before publishing!'
      redirect_back(fallback_location: event_path(@event))
    else
      @event.mark_as_published!
      @event.save
      flash[:success] = 'Event Published'
      redirect_back(fallback_location: event_path(@event))
    end
  end

  def unpublish
    @event = Event.find(params[:id])
    @event.unpublish
    @event.save
    flash[:notice] = 'Event Unpublished'
    redirect_back(fallback_location: event_path(@event))
  end

  def mine
    @events = Event.where(user_id: current_user.id)
  end

  private
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id, :name)
  end

  def my_events
    @events = Event.where(user_id: current_user.id)
  end
end
