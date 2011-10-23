class Permission < ActiveRecord::Base
	validates :add, :presence => true
	validates :edit, :presence => true
	validates :delete, :presence => true
	validates :boolean, :presence => true
	validates :user_id, :presence => true
	validates :list_id, :presence => true
	belongs_to user
	belongs_to list
	validates_associated :user
	validates_associated :list
end
