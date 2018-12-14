class AddOpeningAndClosingColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :opening_time, :integer
    add_column :restaurants, :closing_time, :integer
  end
end
