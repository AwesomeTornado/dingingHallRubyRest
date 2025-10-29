class CreateLocationMenuJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_join_table :locations, :menus do |t|
      t.index [:location_id, :menu_id]
      t.index [:menu_id, :location_id]
    end
  end
end
