class StatesController < ApplicationController
		skip_before_filter :verify_authenticity_token
		skip_before_filter :authenticate_user!
		protect_from_forgery with: :null_session

	def local_govts
		lga = LocalGovtArea.where(state_id: params[:id])
		render json: lga
	end

end