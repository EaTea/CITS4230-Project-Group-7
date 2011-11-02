class Permission < ActiveRecord::Base
	validates :user_id, :presence => true, :uniqueness => { :scope => :list_id}
	validates :list_id, :presence => true, :uniqueness => { :scope => :user_id}
	validates :user, :presence => { :message => "should be an existing user" }
	validates :list, :presence => { :message => "should be an existing list" }

	validate :user_is_not_only_owner, :on => :update, :if => "own_changed?"
	before_destroy :user_is_not_only_owner
	validate :owner_has_all_permissions

	belongs_to :user
	belongs_to :list
	
	private 

		def user_is_not_only_owner
			if own
				perms = Permission.find_by_sql ["SELECT * FROM permissions WHERE list_id = ? AND own = 't'", list_id.to_s]
				puts list_id.to_s
				errors[:own] << (" -- You are the last owner of the list!" + 
						" Please assign someone else ownership before you change your permissions.") if perms.size == 1
			end
		end

		def owner_has_all_permissions
			if own
				unless add and edit and del
					errors[:own] << ("as the list owner, you must give yourself all possible permissions")
				end
			end
		end
end
