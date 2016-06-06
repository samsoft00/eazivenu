class RenameOldTableToNewTable < ActiveRecord::Migration
  def self.up
    rename_table :types, :categories
  end 
end
