class Permission < ActiveRecord::Base
	validates :add, :existence => true
	validates :edit, :existence => true
	validates :delete, :existence => true
	validates :boolean, :existence => true
	validates :user_id, :existence => true
	validates :list_id, :existence => true
	belongs_to user
	belongs_to list
end
