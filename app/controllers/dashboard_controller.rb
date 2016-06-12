class DashboardController < AdminController
	before_action :get_all_booking, only: [:index]

	def index; end



	private

		def get_all_booking
			@bookings = Venue.get_all_bookings()
		end
end
