class AddParamToEventType < ActiveRecord::Migration
  def change
    add_reference :event_types, :venue, index: true, foreign_key: true
    add_reference :event_types, :category, index: true, foreign_key: true
    remove_column :event_types, :name, :string
  end
end
