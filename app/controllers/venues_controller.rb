class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index, :edit]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @booking = Booking.new
  end

  # GET /venues/new
  def new
    @venue = Venue.new
    2.times {@venue.facilities.build} if @venue.new_record?
    4.times {@venue.images.build} if @venue.new_record?

  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    user_type = current_user ? "user" : "alien"
    @venue = Venue.new(venue_params.merge(c_user: current_user, form_step: user_type))
    
    respond_to do |format|
      if @venue.save
         # @venue.event_types << params[:category]
         @venue.category_ids=(params[:category]) unless params[:category].empty? or params[:category].nil?
        format.html { 
            redirect_to (user_type == "alien") ? venue_created_venues_path : @venue, 
            notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      @venue.status = "complete" if @venue.is_incomplete?
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @venues = Venue.all()
  end  

  def booking
    @booking = Booking.new(book_params)
    byebug
    respond_to do |format|
      if @booking.save
        format.html { redirect_to :back, notice: 'Booking request was sent successfully.' }
      else
        format.html {  redirect_to :back, @booking.errors }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :about, :slug, :price, :state_id, :local_govt_area_id, :address, :phone, :email, :capacity, facilities_attributes: [:id, :key, :value], images_attributes: [:id,:thumbnail, :thumbnail_id, :thumbnail_cache_id,:_destroy])
    end

    def book_params
      params.require(:booking).permit(:name, :phone, :email, :from, :to, :venue_id, :category_id)
    end

end
