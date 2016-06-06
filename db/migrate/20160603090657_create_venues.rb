class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.references :state, index: true, foreign_key: true
      t.references :local_govt_area, index: true, foreign_key: true
      t.string :address
      t.string :phone
      t.string :email
      t.references :event_type, index: true, foreign_key: true
      t.string :capacity

      t.timestamps null: false
    end
  end
end
