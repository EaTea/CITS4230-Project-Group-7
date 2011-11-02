class Item < ActiveRecord::Base
	validates :name, :presence => true, :length=>{:maximum => 64}
	validates :description, :length  => {:maximum => 128}
	validates :due_date, :presence => true
	validate :is_later_than_today
	#I think the date's automatically in the right format so I'm not
	#doing extra validation on it
	validates :list_id, :presence => true
#Referential integrity validation
	belongs_to :list
	validates :list, :presence => { :message => "must be a valid list" }

	def is_later_than_today
		unless due_date >= Date.today
			errors[:due_date] << ("must be at a future date")
		end
	end
end
