class Item < ActiveRecord::Base
	validates :name, :presence=>true, :length=>{:maximum => 64}
	validates :description, :length =>{:maximum => 128}
	validates :due_date, :presence=>true
	#I think the date's automatically in the right format so I'm not
	#doing extra validation on it
	validates :completed, :presence=>true
	validates :list_id, :presence=>true
#Referential integrity validation
	belongs_to :list
end
