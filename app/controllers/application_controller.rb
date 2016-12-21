class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, :with => :render_root

  def render_root
    flash[:alert] = 'ID not found'
    redirect_to root_path
  end
  
  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to(root_path)
  end
end
