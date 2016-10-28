class TicketType < ActiveRecord::Base
  belongs_to :event

  def index
  end
end
