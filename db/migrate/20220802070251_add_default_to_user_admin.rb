class AddDefaultToUserAdmin < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :admin, false
    change_column_default :users, :admin, false
  end
end
