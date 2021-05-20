class ChangeStatusToBeStringInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :status, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
