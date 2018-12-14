class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :max_capacity
      t.time :hours_open
      t.string :menu
      t.string :address
      t.string :price_range
      t.integer :phone_number

      t.timestamps
    end
  end
end
