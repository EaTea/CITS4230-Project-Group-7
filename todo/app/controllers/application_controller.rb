class ApplicationController < ActionController::Base
	before_filter :authorize

	def search_for_user
		@user = User.find_by_username(params[:username])
		if @user != nil
			@permission = Permission.find_by_user_id_and_list_id(@user.id, session[:list_id])
		end
		respond_to do |format|
			format.html { redirect_to :controller => "permissions", :action => 'new', :new_permission_user_id => (@user == nil ? nil : @user.id), :not_initial_run => '1', :already_exists => @permission != nil}
		end
	end

	def is_number?(object)
		true if Integer(object) rescue false
	end

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
