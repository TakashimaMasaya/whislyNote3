class AddBlogsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :blogs, :user_id, false
  end
end
