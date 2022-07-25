class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :description
      t.string :user_id

      t.timestamps
    end
    add_index :memos, :user_id
  end
end
