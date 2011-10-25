class Permission < ActiveRecord::Base
	validates :user_id, :presence => true, :uniqueness => { :scope => :list_id}
	validates :list_id, :presence => true, :uniqueness => { :scope => :user_id}
	validates :user, :presence => { :message => "should be an existing user" }
	validates :list, :presence => { :message => "should be an existing list" }
	belongs_to :user
	belongs_to :list
#validates_associated :user
#	validates_associated :list
end
