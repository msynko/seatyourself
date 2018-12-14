class RemoveOpeningAndClosingTimeColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :opening_time
    remove_column :restaurants, :closing_time
  end
end
