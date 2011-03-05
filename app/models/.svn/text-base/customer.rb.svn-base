class Customer < ActiveRecord::Base
	has_many :casts
	attr_accessor :name

	def name
		self.last_name + self.first_name
	end
	
end
