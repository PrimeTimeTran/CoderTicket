class AddUsersToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :user
  end
end