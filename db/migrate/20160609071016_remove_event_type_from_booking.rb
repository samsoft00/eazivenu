class RemoveEventTypeFromBooking < ActiveRecord::Migration
  def change
    remove_reference :bookings, :event_type, index: true, foreign_key: true
  end
end
