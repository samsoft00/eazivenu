class AddPriceToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :price, :string
  end
end
