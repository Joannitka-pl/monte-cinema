class AddDateToSeances < ActiveRecord::Migration[6.1]
  def change
    add_column :seances, :date, :date
  end
end
