class CastsController < ApplicationController

  before_filter :require_user, :only => [:new,:query]

  
	def new
		#@customer = Customer.find(@current_user.id)
		#flash.clear		
		flash.clear if request.post?
		if request.post?
			@issue_no ||= params[:issue_no]	
			@customer = Customer.find_by_issue_no(@issue_no)
			if !@customer.nil?
				flash[:notice] = l :notice_successful_loaded_customer	
				@cast = Cast.new
			else 
				flash[:error] = l :error_cant_found_customer_from_issue_no, :issue_no => @issue_no
			end	
		end 
		respond_to	do |format|
			format.html
		end

	end
	
	def create
		@customer = Customer.find_by_id(params[:customer_id])
		logger.info "Customer Name : #{@customer.name} "
		logger.info "money : #{params[:cast][:money].to_i}"
		if params[:cast][:money].to_i > 0 
			if @customer.money && @customer.money >= params[:cast][:money]
				@customer.casts << Cast.new(params[:cast]) 
				flash[:notice] = "Successfully cast #{params[:cast][:money]}"
			else
				redirect_to "/cast/?issue_no=#{@customer.issue_no}" , :flash => { :error => l (:error_insufficient_funds) }
			end
		else
			redirect_to "/cast/?issue_no=#{@customer.issue_no}" , :flash => { :error => l (:error_invalid_number) }
		end
	end
end
