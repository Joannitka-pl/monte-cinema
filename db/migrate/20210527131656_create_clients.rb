class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.boolean :real_user

      t.timestamps
    end
  end
end
