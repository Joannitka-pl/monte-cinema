class ChangeRoleDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role, :user
  end
end
