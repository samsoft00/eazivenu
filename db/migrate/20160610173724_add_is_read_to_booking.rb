class AddIsReadToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :is_read, :boolean
  end
end
