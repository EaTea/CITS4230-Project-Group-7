class UsersController < ApplicationController
	skip_filter :authorize, :only => [:new, :create]
	before_filter :admin, :except => [:new, :create, :show, :update, :edit]
	# GET /users
	# GET /users.xml
	def index
		@users = User.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml	{ render :xml => @users }
		end
	end

	# GET /users/1
	# GET /users/1.xml
	def show
		@is_admin = is_admin?(session[:user_id])
		@user = @is_admin ? User.find(params[:id]) : User.find(session[:user_id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml	{ render :xml => @user }
		end
	end

	# GET /users/new
	# GET /users/new.xml
	def new
		self.class.layout('embed')
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml	{ render :xml => @user }
		end
	end

	# GET /users/1/edit
	def edit
		@is_admin = is_admin?(session[:user_id])
		@user = @is_admin ? User.find(params[:id]) : User.find(session[:user_id])
	end

	# POST /users
	# POST /users.xml
	def create
		self.class.layout('embed')
		@user = User.new(params[:user])

		respond_to do |format|
			if @user.save
				format.html	{ redirect_to(new_user_path, :notice => 'User was successfully created.') }
				format.xml	{ render :xml => @user, :status => :created, :location => @user }
			else
				format.html	{ render :action => "new" }
				format.xml	{ render :xml => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /users/1
	# PUT /users/1.xml
	def update
		if !is_admin?(session[:user_id]) and session[:user_id].to_i.to_s != params[:id].to_i.to_s
			@user = User.find(session[:user_id])
			respond_to do |format|
				format.html	{ render :action => "show" }
				format.xml  { render :xml => @user }
			end
		else
			@user = User.find(params[:id])

			respond_to do |format|
				if @user.update_attributes(params[:user])
					format.html	{ redirect_to(@user, :notice => 'User was successfully updated.') }
					format.xml	{ head :ok }
				else
					format.html	{ render :action => "edit" }
					format.xml	{ render :xml => @user.errors, :status => :unprocessable_entity }
				end
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.xml
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html	{ redirect_to(users_url) }
			format.xml	{ head :ok }
		end
	end
end
