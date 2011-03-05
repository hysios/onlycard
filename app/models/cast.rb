class Cast < ActiveRecord::Base
	belongs_to :customer
	validates_presence_of :money
	validates_numericality_of :money

	def validate
		errors.add_to_base "Your balance is less than" if customer.money && money > customer.money 
	end	
end
