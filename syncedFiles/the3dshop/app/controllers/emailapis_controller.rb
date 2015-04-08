class EmailapisController < ApplicationController
  def index
  	if !flash["email"].nil?
  		@success = true
  		@email = flash["email"]
  	end
  end

  def subscribe
  	
    @list_id = "34e01f4890"
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })
    flash["email"] = params[:email][:address]
    redirect_to emailapi_path
	end
end
