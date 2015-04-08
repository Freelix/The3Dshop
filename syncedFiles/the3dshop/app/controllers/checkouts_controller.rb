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
			:currency    => 'cad',
			:receipt_email => @user.email
	  )
	  send_simple_message
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

	def send_simple_message
        #partial_html = render :partial => "checkouts/received_email"
        partial_html = view_context.render "checkouts/received_email"

		#Item.find(current_order.order_items.item_id)
  		RestClient.post "https://api:key-076bfd12e7ff2487d091b671df41e02f"\
  		"@api.mailgun.net/v3/sandboxbe6696212f5e486dbc8f05bb92fed980.mailgun.org/messages",
  		:from => "support@the3dshop.com",
  		:to => @user.email,
  		:subject => "Receipt confirm for #{@user.firstname} #{@user.lastname}",
  		:html => partial_html.to_str,
  		:text => ""
	end
end
