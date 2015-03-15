class OrderItemsController < ApplicationController
  before_filter :remote_auth_user

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)

    if !already_exist?
      @order.save
      session[:order_id] = @order.id

      current_user.cart_order_id = @order.id
      current_user.save
    else
      @errorToShow = true
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  
  def order_item_params
    params.require(:order_item).permit(:item_id)
  end

  # Check if it exists in the shopping cart
  def already_exist?
    item = Item.find(order_item_params[:item_id])

    exist = false
    
    current_order.order_items.each do |order_item|
      if order_item.item.id == item.id
        exist = true
      end
    end

    return exist
  end
end