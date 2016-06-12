class SettingsController < AdminController
	before_filter :find_model

	def index
		@setting = Setting.all()
	end


	def create
		# byebug
		Setting.all.each do |m_setting|
			# params.each_pair do |key, value|
				# byebug
				if params[m_setting.config_key.to_sym].present?
					s = Setting.find_by_config_key(m_setting.config_key.to_sym)
					# byebug
					s.config_value = params[m_setting.config_key.to_sym]
					s.save
				end
			# end
		end
		redirect_to :back, :notice => 'Settings updated' # Redirect to the settings index
	end
	

	private
	def find_model
		@model = Setting.find(params[:id]) if params[:id]
	end

	def setting_params
		params.require(:setting).permit(:Managerlogin)
	end

end