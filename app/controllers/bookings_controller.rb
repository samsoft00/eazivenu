class BookingsController < ApplicationController
	before_action :set_booking, only: [:show]
  before_action :set_venue

	def index
	end


	def show
	end


  def create
    @booking = Booking.new(book_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to :back, notice: 'Booking request was sent successfully.' }
      else
        format.html {  redirect_to :back, @booking.errors }
      end
    end

  end
	

	private
	def set_booking
		@booking = Booking.find(params[:id]) if params[:id]
	end

  def set_venue
    @venue = Venue.friendly.find(params[:venue_id]) if params[:venue_id]
  end

  def book_params
    params.require(:booking).permit(:name, :phone, :email, :from, :to, :venue_id, :category_id)
  end

end