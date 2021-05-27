class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :sort
      t.decimal :price
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
