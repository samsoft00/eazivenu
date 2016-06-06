class AdminController < ApplicationController
	before_action :check_if_user_is_admin

	

	private
	def check_if_user_is_admin
		redirect_to request.referer || root_path if !current_user.is_admin?
	end
end