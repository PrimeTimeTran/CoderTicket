class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :quantity
      t.integer :price
      t.references :ticket_type, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
