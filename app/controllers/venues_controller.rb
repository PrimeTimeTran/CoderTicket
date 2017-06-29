class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    flash[:success] = "Venue Created!"
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :full_address, :region_id)
  end
end
