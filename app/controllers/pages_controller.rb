class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :venue_created]
end
