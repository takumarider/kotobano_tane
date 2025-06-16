class Parents::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    parent_dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
