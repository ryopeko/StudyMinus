class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.references :activity, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
