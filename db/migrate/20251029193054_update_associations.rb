class UpdateAssociations < ActiveRecord::Migration[8.1]
  def change
    remove_column :foods, :menu_id
  end
end
