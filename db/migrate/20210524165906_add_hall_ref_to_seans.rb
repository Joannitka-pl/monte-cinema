class AddHallRefToSeans < ActiveRecord::Migration[6.1]
  def change
    add_reference :seans, :hall, null: false, foreign_key: true
  end
end
