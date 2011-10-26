class List < ActiveRecord::Base
	validates :name, :presence => true, :length => {:maximum => 64}
#Referential Integrity validation
	has_many :permissions, :dependent => :destroy
	has_many :users, :through => :permissions
	has_many :items, :dependent => :destroy
	validates_associated :items
end
