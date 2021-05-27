class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.string :row
      t.intiger :number
      t.boolean :availability
      t.references :hall, null: false, foreign_key: true

      t.timestamps
    end
  end
end
