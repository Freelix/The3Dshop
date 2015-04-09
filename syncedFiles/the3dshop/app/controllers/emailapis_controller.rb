class EmailapisController < ApplicationController
  def index
  	if !flash["email_error"].nil?
  		@error = true
			@subscribe = flash["email_error"]
  	elsif !flash["email"].nil?
  		@success = true
  		@email = flash["email"]
  	end
  end

  def subscribe
  	
    @list_id = "34e01f4890"
    gb = Gibbon::API.new
		
    response = gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })

		if(response.is_a?(Hash))
      puts response
      case response['code']
	      when 502
	        @email_error = "Invalid Address!"
	      when 214
	        @email_error = "This email is already signed up!"
	      else
	        @email_error = response['error']
      end
        @email_success = nil
	    else
	      @email_success = "Thanks!"
	     	@email_error = nil
		end

    flash["email"] = params[:email][:address]
		flash["email_error"] = @email_error
    
  	redirect_to emailapi_path
	end
end