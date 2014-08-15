class RemoveActivityIdFromActivityTypes < ActiveRecord::Migration
  def change
    remove_column :activity_types, :activity_id
  end
end
