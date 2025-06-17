class HomeController < ApplicationController
  def index
    if parent_signed_in?
      redirect_to parent_dashboard_path
    elsif child_signed_in?
      redirect_to child_dashboard_path
    end
  end
end
