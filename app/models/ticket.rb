class Ticket < ApplicationRecord
  belongs_to :ticket_type
  # belongs_to :User, => class_name: "User"

  validate :ticket_quantity
  validates :quantity, numericality: {greater_than: 0, only_integer: true, less_than: 11}

  private
  def ticket_quantity
    # TODO this is only correct for a specific user
    # TODO count total number of avaliable tickets for this ticket_type

    if ticket_type && quantity && quantity > ticket_type.remaining_quantity
      errors.add(:quantity, "can't be greater than #{ticket_type.remaining_quantity} remaining tickets")
    end

  end

end
