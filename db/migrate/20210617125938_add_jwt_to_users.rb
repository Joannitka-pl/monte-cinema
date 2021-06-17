class AddJwtToUsers < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :users, :jti, :string, null: false
      add_index :users, :jti, unique: true
    
    end
  end
end
