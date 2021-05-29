class AddTimeToSeances < ActiveRecord::Migration[6.1]
  def change
    add_column :seances, :time, :time
  end
end
