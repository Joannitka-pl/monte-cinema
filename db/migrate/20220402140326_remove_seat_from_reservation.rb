class RemoveSeatFromReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :seat, :string
  end
end
