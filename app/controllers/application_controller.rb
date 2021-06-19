class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit
  respond_to :json
end
