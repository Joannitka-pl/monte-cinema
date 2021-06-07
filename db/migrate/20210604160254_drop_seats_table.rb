class DropSeatsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :seats
  end
end
