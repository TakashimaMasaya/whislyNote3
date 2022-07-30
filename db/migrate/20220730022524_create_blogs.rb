class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.string :user_id

      t.timestamps
    end
    add_index :blogs, :user_id
  end
end
