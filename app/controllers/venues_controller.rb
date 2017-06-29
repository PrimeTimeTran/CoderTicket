class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    if @venue.save
      flash[:success] = "Venue Created!"
      redirect_to root_path
    else
      flash[:error] = @venue.errors.full_messages.to_sentence
      redirect_back fallback_location: root_path
    end
  end

  def show
  end

  def edit
    @venue = Venue.find(:venue_id)
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id, :venue_id)
  end
end
