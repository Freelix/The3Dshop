class CheckoutsController < ApplicationController
	before_filter :authenticate_user!

  def new
	@user = current_user
	@order_items = current_order.order_items
  end

  def create
	  # Amount in cents
	  @amount = params[:total_price].to_i.round()
	  @user = current_user

	  customer = Stripe::Customer.create(
			:email => @user.email,
			:card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @amount * 100,
			:description => 'The3DShop customer',
			:currency    => 'cad'
	  )

	  remove_order

		rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_checkouts_path
	end

	private

	def remove_order
    current_order.order_items.destroy_all
    current_user.cart_order_id = nil
		session[:order_id] = nil
	end
end
