class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :ticket_desks, :type, :category
  end
end
