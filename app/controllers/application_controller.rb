class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session  
  respond_to :json

  rescue_from StandardError do |exception|
    logger.error(exception)
    render :json => {errors: [exception.message]}, :status => :unprocessable_entity
  end
end
