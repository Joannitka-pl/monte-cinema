class AddKeyToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :key, :string, default: '================', null: false
  end
end
