class RemoveColumnTitleFromBlog < ActiveRecord::Migration[5.2]
  def up
    remove_column :blogs, :title
  end

  def down
    add_column :blogs, :title
  end
end
