class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  def remaining_quantity
    # max_quantity - tickets.size # Works
    max_quantity - tickets.sum{|t| t.quantity}
  end
end
