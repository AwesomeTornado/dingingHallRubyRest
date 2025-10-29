class ChangeFoodMenuToForiegnKey < ActiveRecord::Migration[8.1]
  def change
    rename_column :foods, :menu, :menu_id
    add_foreign_key :foods, :menus
  end
end
