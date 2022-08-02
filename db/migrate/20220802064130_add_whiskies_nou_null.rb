class AddWhiskiesNouNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :whiskies, :name, false
  end
end
