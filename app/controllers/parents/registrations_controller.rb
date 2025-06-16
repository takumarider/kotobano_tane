class Parents::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    parent_dashboard_path
  end

  def after_update_path_for(resource)
    parent_dashboard_path
  end
end
