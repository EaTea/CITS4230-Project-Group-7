class ApplicationController < ActionController::Base
	before_filter :authorize

	protected

		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to login_url, :alert => "Please log in"
			end
		end
		def admin
			unless User.find_by_id(session[:user_id]).username == "admin"
				redirect_to login_url, :alert => "Please log in"
			end
		end

	protect_from_forgery
end
