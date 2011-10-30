class ItemsController < ApplicationController
	layout 'embed'
	# GET /items
	# GET /items.xml
	def index
		session[:list_id] = params[:list_id]
		@find_completed = params[:comp]
		@items = List.find(params[:list_id]).items.find_all_by_completed(@find_completed)

		respond_to do |format|
			format.html # index.html.erb
			format.xml	{ render :xml => @items }
		end
	end

	# GET /items/1
	# GET /items/1.xml
	def show
		@item = Item.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml	{ render :xml => @item }
		end
	end

	# GET /items/new
	# GET /items/new.xml
	def new
		@item = Item.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml	{ render :xml => @item }
		end
	end

	# GET /items/1/edit
	def edit
		@item = Item.find(params[:id])
	end

	# POST /items
	# POST /items.xml
	def create
		@item = Item.new(params[:item])
		@item.list_id = session[:list_id]

		respond_to do |format|
			if @item.save
				format.html	{ redirect_to(@item, :notice => 'Item was successfully created.') }
				format.xml	{ render :xml => @item, :status => :created, :location => @item }
			else
				format.html	{ render :action => "new" }
				format.xml	{ render :xml => @item.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /items/1
	# PUT /items/1.xml
	def update
		@item = Item.find(params[:id])
		@item.list_id = session[:list_id]

		respond_to do |format|
			if @item.update_attributes(params[:item])
				format.html	{ redirect_to(@item, :notice => 'Item was successfully updated.') }
				format.xml	{ head :ok }
			else
				format.html	{ render :action => "edit" }
				format.xml	{ render :xml => @item.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /items/1
	# DELETE /items/1.xml
	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		respond_to do |format|
			format.html	{ redirect_to :action => 'index', :list_id => session[:list_id], :comp => 'f' }
			format.xml	{ head :ok }
		end
	end
end
