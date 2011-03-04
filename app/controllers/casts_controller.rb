class CastsController < ApplicationController

  before_filter :require_user, :only => [:new,:query]
  
	def new
		#@customer = Customer.find(@current_user.id)
		if request.post?
			@issue_no = params[:issue_no] if request.post?
			@customer = Customer.find_by_issue_no(@issue_no)
			if !@customer.nil?
				flash[:notice] = "Successfully Loaded Customer..."			
				@cast = Cast.new
			else 
				flash[:error] = "Can't Load Customer Info"
			end
					
		end		
		respond_to	do |format|
			format.html
		end

	end
	

	
	def create
		@customer = Customer.find_by_id(params[:customer_id])
		@customer.casts << Cast.new(params[:cast])
		flash[:notice] = "Successfully cast #{params[:cast][:money]}"
		redirect_to new_cast_url
	end
end
