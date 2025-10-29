class CreateFoodMenuJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_join_table :foods, :menus do |t|
      t.index [:food_id, :menu_id]
      t.index [:menu_id, :food_id]
    end
  end
end
