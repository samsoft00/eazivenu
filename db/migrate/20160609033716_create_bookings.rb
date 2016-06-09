class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.date :from
      t.date :to
      t.references :venue, index: true, foreign_key: true
      t.references :event_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
