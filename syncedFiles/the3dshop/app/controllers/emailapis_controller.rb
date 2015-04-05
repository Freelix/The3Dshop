class EmailapisController < ApplicationController
  def index
  end

  def subscribe

    @list_id = "34e01f4890"
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })
    redirect_to emailapi_path
	end

end
