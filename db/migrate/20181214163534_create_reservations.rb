class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.integer :restaurant_id
      t.integer :party_size
      t.date :time

      t.timestamps
    end
  end
end
