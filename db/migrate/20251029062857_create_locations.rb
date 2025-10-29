class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
