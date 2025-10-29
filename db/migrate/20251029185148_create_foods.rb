class CreateFoods < ActiveRecord::Migration[8.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.boolean :vegan
      t.boolean :vegetarian
      t.boolean :pork

      t.timestamps
    end
  end
end
