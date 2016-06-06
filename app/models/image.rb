class Image < ActiveRecord::Base
  belongs_to :venue
  attachment :thumbnail, type: :image, destroy: true

  after_destroy :remove_file

  private
		def remove_file
			thumbnail.delete
		end  

end
