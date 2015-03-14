class UserController < ApplicationController

  before_filter :authenticate_user!

  def show
  	@items = current_user.items

  	if @items.count > 0
  		build_collection
      troncate_descriptions

  		@showTable = true
  	else
  		@showTable = false
  	end
  end

  private

  def build_collection
    numberPerPage = 4

    page = if params[:page].to_i > 0
      params[:page].to_i
    else
      1
    end

    @items = @items.paginate(:page => page, :per_page => numberPerPage)
  end

  def troncate_descriptions
    @items.map {
      |item| 

      if item.description.length > 551
        item.description = item.description[0, 550] + "..."
      end
    }
  end

end
