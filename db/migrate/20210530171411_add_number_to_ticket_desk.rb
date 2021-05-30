class AddNumberToTicketDesk < ActiveRecord::Migration[6.1]
  def change
    add_column :ticket_desks, :number, :integer
  end
end
