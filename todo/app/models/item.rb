class Item < ActiveRecord::Base
	validates :username, :presence=>true, :length=>{:maximum=>32}, :uniqueness=>true
	validates :password, :presence=>true, :length=>{:maximum=>128}
	validates :salt, :presence=>true, :length=>{:maximum=>16}
	validates :email, :presence => true, :length=>{:maximum=>64}, :uniqueness=>true
end
