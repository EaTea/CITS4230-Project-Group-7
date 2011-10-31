class Permission < ActiveRecord::Base
	validates :user_id, :presence => true, :uniqueness => { :scope => :list_id}
	validates :list_id, :presence => true, :uniqueness => { :scope => :user_id}
	validates :user, :presence => { :message => "should be an existing user" }
	validates :list, :presence => { :message => "should be an existing list" }

	validate :user_is_not_only_owner, :on => :update, :on => :delete, :if => "own_changed? and own == false"
	validate :owner_has_all_permissions, :on => :update, :if => "own_changed? and own == true"

	belongs_to :user
	belongs_to :list
	
	private 

		def user_is_not_only_owner
			perms = Permission.find_by_sql ["SELECT * FROM permissions WHERE list_id = ? AND own = 't'", list_id.to_s]
			puts list_id.to_s
			errors.add(:own, " -- You are the last owner of the list!" + 
					" Please assign someone else ownership before you change your permissions.") if perms.size == 1
		end

		def owner_has_all_permissions
			unless add and edit and del
				record.errors[:own] << ("as the list owner, you must give yourself all possible permissions")
			end
		end
end
