# Code taken from Ruby-on-Rails guide
# http://guides.rubyonrails.org/active_record_validations_callbacks.html 

require 'digest/sha2'

class EmailValidator < ActiveModel::Validator
  def validate(record)
		@value = record.email
    unless @value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[:email] << ("is not an email")
    end
  end
end

class User < ActiveRecord::Base
	include ActiveModel::Validations
#attr_accessor :id
	attr_accessible :username, :email, :password, :password_confirmation, :email_confirmation
	validates :username, :presence=>true, :length=>{:maximum=>32}, :uniqueness=>true
	validates :password, :presence=>true, :length=>{:maximum=>128}, :confirmation => true
	validates :password_confirmation, :presence=>true, :length=>{:maximum=>128}
	#validates :salt, :presence=>true, :length=>{:is=>16}
	#this shouldn't be needed anymore, salt is automatically generated
	validates :email, :presence => true, :length=>{:maximum=>64}, :uniqueness=>true, :confirmation => true
	validates :email_confirmation, :presence => true, :length=>{:maximum=>64}, :confirmation => true
	validates_with EmailValidator, :if => "email?"

	#automatically generate salt
	before_validation(:on => :create) do
		self.salt = make_salt if new_record?
	end

#Validations for referential integrity follow
	has_many :permissions, :dependent => :destroy
	has_many :lists, :through => :permissions

	before_destroy :is_only_owner

	private 
		def make_salt
  	 	secure_hash("#{Time.now.utc}--#{password}")
			#secure_hash to get a hash of current time
  	end
		def secure_hash(string)
  	 	Digest::SHA2.hexdigest(string)
  	end
		def is_only_owner
			sql_find_lists = "SELECT l.* FROM lists l, permissions p WHERE l.id = p.list_id AND p.user_id = " + id.to_s
			#not neat but incorrect behaviour when using other notation [string, args]
			del_candidates = List.find_by_sql sql_find_lists
			del_candidates.each do |l|
				perms = Permission.find_by_sql ["SELECT * FROM permissions WHERE user_id = ? AND list_id = ? AND own = 't'", id, @l.id]
				if perms.size == 1
					@l.destroy
				end
			end
			#incorrect behaviour when splitting into lines, tried using semi-colon
			#separation but still resulted in incorrect behaviour during
			#prototyping in rails console, reverting to single line solution
		end
end
