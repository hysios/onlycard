class Cast < ActiveRecord::Base
	belongs_to :customer
	
	validates_presence_of :money, :on => :create, :message => "can't be blank"

	def validate
		
		if customer.money.nil? or  money <= customer.money 
  		errors.add_to_base("you must great surplus money!")
 		end
	end	
end
