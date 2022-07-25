class CreateWhiskies < ActiveRecord::Migration[5.2]
  def change
    create_table :whiskies do |t|
      t.string :name
      t.text :description
      t.string :user_id

      t.timestamps
    end
    add_index :whiskies, :user_id
  end
end
