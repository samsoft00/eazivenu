class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :config_key
      t.boolean :config_value

      # t.timestamps null: false
    end
  end
end
