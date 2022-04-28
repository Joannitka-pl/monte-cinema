class AddUsedToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :used, :boolean, default: false, null: false
  end
end
