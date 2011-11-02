class PermissionsController < ApplicationController
	layout 'embed'

	# GET /permissions
	# GET /permissions.xml
	def index
		@permissions = (session[:list_id]) ? Permission.find_all_by_list_id(session[:list_id]) : Permission.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml	{ render :xml => @permissions }
		end
	end

	# GET /permissions/1
	# GET /permissions/1.xml
	def show
		@permission = Permission.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml	{ render :xml => @permission }
		end
	end

	# GET /permissions/new
	# GET /permissions/new.xml
	def new
		@permission = Permission.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml	{ render :xml => @permission }
		end
	end

	# GET /permissions/1/edit
	def edit
		@permission = Permission.find(params[:id])
	end

	# POST /permissions
	# POST /permissions.xml
	def create
		@permission = Permission.new(params[:permission])

		respond_to do |format|
			if @permission.save
				format.html	{ redirect_to(@permission, :notice => 'Permission was successfully created.') }
				format.xml	{ render :xml => @permission, :status => :created, :location => @permission }
			else
				format.html {redirect_to :action => 'new', :new_permission_user_id => @permission.user_id, :not_initial_run => '1', :already_exists => false }
				format.xml	{ render :xml => @permission.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /permissions/1
	# PUT /permissions/1.xml
	def update
		@permission = Permission.find(params[:id])

		respond_to do |format|
			if @permission.update_attributes(params[:permission])
				format.html	{ redirect_to(@permission, :notice => 'Permission was successfully updated.') }
				format.xml	{ head :ok }
			else
				format.html	{ redirect_to :action => 'edit', :new_permission_user_id => @permission.user_id, :not_initial_run => '1', :already_exists => false }
				format.xml	{ render :xml => @permission.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /permissions/1
	# DELETE /permissions/1.xml
	def destroy
		@permission = Permission.find(params[:id])
		@permission.destroy

		respond_to do |format|
			format.html	{ redirect_to(permissions_url) }
			format.xml	{ head :ok }
		end
	end
end
