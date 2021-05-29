class RemoveDateFromSeances < ActiveRecord::Migration[6.1]
  def change
    remove_column :seances, :date, :datetime
  end
end
