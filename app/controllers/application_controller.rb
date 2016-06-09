class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

		def after_sign_in_path_for(resource)
			# byebug
			if is_admin?(resource)
				return edit_venue_path(id: resource.venues.first.slug) if resource.venues.first.is_incomplete?
				return dashboard_index_path
			else
				return edit_venue_path(resource.venues.first.slug) if resource.venues.first.is_incomplete?
				return venues_path
			end
			venues_path

		end


		def is_admin?(resource)
			resource.is_admin?
		end

end
