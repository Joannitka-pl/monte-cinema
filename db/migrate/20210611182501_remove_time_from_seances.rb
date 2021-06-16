class RemoveTimeFromSeances < ActiveRecord::Migration[6.1]
  def change
    remove_column :seances, :time, :time
  end
end
