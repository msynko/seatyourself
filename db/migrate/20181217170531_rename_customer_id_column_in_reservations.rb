class RenameCustomerIdColumnInReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :customer_id, :user_id
  end
end
