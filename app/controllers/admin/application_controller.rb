class Admin::ApplicationController < ApplicationController

  before_action :ensure_admin!

  def index
  end

  private

  def ensure_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: 'Only admins allowed in there <3'
    end
  end
end
