class AddSeatToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :seat, :string
  end
end
