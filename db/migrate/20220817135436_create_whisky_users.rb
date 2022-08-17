class CreateWhiskyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :whisky_users do |t|
      t.references :whisky, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
