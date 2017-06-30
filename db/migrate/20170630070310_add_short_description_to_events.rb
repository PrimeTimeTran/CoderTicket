class AddShortDescriptionToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :card_description, :text
  end
end
