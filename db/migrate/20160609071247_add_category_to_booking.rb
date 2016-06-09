class AddCategoryToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :category, index: true, foreign_key: true
  end
end
