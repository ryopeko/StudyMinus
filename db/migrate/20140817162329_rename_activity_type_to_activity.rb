class RenameActivityTypeToActivity < ActiveRecord::Migration
  def change
    rename_column :activities, :activity_type, :activity_type_id
  end
end
