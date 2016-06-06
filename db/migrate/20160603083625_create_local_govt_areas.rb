class CreateLocalGovtAreas < ActiveRecord::Migration
  def change
    create_table :local_govt_areas do |t|
      t.references :state, index: true, foreign_key: true
      t.string :lga

      # t.timestamps null: false
    end
  end
end
