class AddSeatToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :seat, :string
  end
end
