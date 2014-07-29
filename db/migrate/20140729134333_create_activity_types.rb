class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.references :activity
      t.string :name

      t.timestamps
    end
  end
end
