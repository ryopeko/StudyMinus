class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false
      t.integer :activity_type, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
