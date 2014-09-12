class ChangeDescriptionOfActivity < ActiveRecord::Migration
  def change
    change_column :activities, :description, :text, null: true
  end
end
