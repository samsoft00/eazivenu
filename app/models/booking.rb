class Booking < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category

  validates :name, :phone, :email, :from, :to, :venue_id, :category_id, presence: true
end
