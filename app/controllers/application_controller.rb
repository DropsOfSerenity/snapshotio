class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  protect_from_forgery with: :exception

  private

  def not_authorized
    redirect_to root_path, alert: 'You are not allowed here. Try logging in if you haven\'t already.'
  end

end
