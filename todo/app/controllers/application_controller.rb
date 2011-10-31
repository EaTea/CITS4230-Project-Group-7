class ApplicationController < ActionController::Base
	before_filter :authorize

	protected

		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to login_url, :alert => "Please log in"
			end
		end
		def is_admin?(id)
			User.find(id).username == "admin"
		end
		def admin
			unless is_admin?(session[:user_id])
				redirect_to login_url, :alert => "Please log in"
			end
		end

	protect_from_forgery
end
