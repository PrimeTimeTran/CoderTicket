class AddOrderIdToTickets < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :order, foreign_key: true
  end
end
