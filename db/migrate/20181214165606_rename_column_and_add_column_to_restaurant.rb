class RenameColumnAndAddColumnToRestaurant < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :hours_open, :opening_time
    add_column :restaurants, :closing_time, :time
  end
end
