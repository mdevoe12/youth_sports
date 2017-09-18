class DashboardController < ApplicationController

  def index
    redirect_to login_path if current_user.nil?
  end

end
