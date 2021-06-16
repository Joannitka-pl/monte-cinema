class DateChangeDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :seances, :date, :datetime
  end
end
