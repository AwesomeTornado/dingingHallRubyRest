class AddMenuToFoods < ActiveRecord::Migration[8.1]
  def change
    add_column :foods, :menu, :menus
  end
end
