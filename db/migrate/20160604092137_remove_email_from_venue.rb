class RemoveEmailFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :email, :string
  end
end
