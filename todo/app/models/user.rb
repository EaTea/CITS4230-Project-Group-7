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
	attr_accessible :username, :email, :password, :password_confirmation, :email_confirmation
	validates :username, :presence => true, :length => {:within => 4..32}, :uniqueness => true
	validates :password, :presence => true, :length => {:within => 6..128}, :confirmation => true
	validates :password_confirmation, :presence => true, :length => {:within => 6..128}
	validates :email, :presence => true, :length => {:maximum => 64}, :uniqueness => true, :confirmation => true
	validates :email_confirmation, :presence => true, :length => {:maximum => 64}
	validates_with EmailValidator, :if => "email?"

	#automatically generate salt and encrypts password
	before_save :encrypt_password
	before_destroy :is_only_owner

#Validations for referential integrity follow
	has_many :permissions, :dependent => :destroy
	has_many :lists, :through => :permissions


	def authenticate?(sub_password)
		password == encrypt(sub_password)
	end

	private 
		def encrypt_password
			self.salt = make_salt if new_record? 
			self.password = encrypt(password)
		end
		def make_salt
  	 	secure_hash("#{Time.now.utc}--#{password}")
			#secure_hash to get a hash of current time
  	end
		def encrypt(string)
			temp_string = string
	   	for i in 1..3 do 
				temp_string = secure_hash("#{salt}--#{temp_string}") 
			end
			temp_string
  	end
		def secure_hash(string)
  	 	Digest::SHA2.hexdigest(string)
  	end
		def is_only_owner
			sql_find_lists = "SELECT l.* FROM lists l, permissions p WHERE p.own = 't' AND l.id = p.list_id AND p.user_id = " + id.to_s
			#not neat but I got incorrect behaviour when using other notation [string, args]
			puts 'entering this method!'
			del_candidates = List.find_by_sql sql_find_lists
			del_candidates.each do |l|
				perms = Permission.find_by_sql ["SELECT * FROM permissions WHERE list_id = ? AND own = 't'", l.id]
				if perms.size == 1
					puts l.id
					l.destroy
				end
			end
			#incorrect behaviour when splitting into lines, tried using semi-colon
			#separation but still resulted in incorrect behaviour during
			#prototyping in rails console, reverting to single line solution
		end
end
