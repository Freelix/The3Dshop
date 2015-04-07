class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :redirect_domain

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    elsif !current_user.nil? && !current_user.cart_order_id.nil?
      session[:order_id] = current_user.cart_order_id
      Order.find(current_user.cart_order_id)
    else
      Order.new
    end
  end

  def remote_auth_user
    if !user_signed_in?
      render :js => "window.location = '#{new_user_session_path}'"
    end
  end

  protected

  # Indicates which attributes devise could use for those different actions 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :phone_number, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :phone_number, :email, :current_password, :password, :password_confirmation) }
  end

  def redirect_domain
    if request.host == 'www.the3dshop.ca'
      redirect_to 'http://the3dshop.ca' + request.fullpath
    end
  end

end
