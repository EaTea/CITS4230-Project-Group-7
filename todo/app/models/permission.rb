class Permission < ActiveRecord::Base
#validates :add, :presence => true
#validates :edit, :presence => true
#	validates :delete, :presence => true
#	validates :own, :presence => true
	validates :user_id, :presence => true, :uniqueness => { :scope => :list_id}
	validates :list_id, :presence => true, :uniqueness => { :scope => :user_id}
	belongs_to :user
	belongs_to :list
#validates_associated :user
#	validates_associated :list
end
