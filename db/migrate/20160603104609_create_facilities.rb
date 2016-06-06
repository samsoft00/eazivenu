class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :key
      t.string :value
      t.references :venue, index: true, foreign_key: true

      # t.timestamps null: false
    end
  end
end
