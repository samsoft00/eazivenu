class AddAboutToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :about, :text
  end
end
