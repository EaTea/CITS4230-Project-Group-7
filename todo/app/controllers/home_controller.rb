class HomeController < ApplicationController
  def index
  end

	def assign_list_id
		session[:list_id] = params[:session][:list_id]
		redirect_to root_url
	end
end
