class AddParamsToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :is_manager, :boolean
  end
end
