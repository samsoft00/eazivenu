class Category < ActiveRecord::Base
	has_many :event_types
	has_many :venues, through: :event_types
end
