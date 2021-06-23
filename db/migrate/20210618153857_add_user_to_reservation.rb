class AddUserToReservation < ActiveRecord::Migration[6.1]
  def change
    change_table :reservations do |t|
      t.belongs_to :user, null: true
    end
  end
end
