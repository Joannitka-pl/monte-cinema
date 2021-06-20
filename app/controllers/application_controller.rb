class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  private

  def user_not_authorized
    render json: { message: 'You are not authorized for access.' }
  end
end
