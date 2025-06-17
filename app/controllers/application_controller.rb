class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_child, :child_signed_in?

  def current_user
    current_parent || current_child
  end

  def current_child
    @current_child ||= Child.find_by(id: session[:child_id])
  end

  def child_signed_in?
    current_child.present?
  end

  private

  def authenticate_user!
    unless parent_signed_in? || child_signed_in?
      redirect_to root_path, alert: "\u30ED\u30B0\u30A4\u30F3\u304C\u5FC5\u8981\u3067\u3059"
    end
  end

  def authenticate_parent!
    unless parent_signed_in?
      redirect_to new_parent_session_path, alert: "\u4FDD\u8B77\u8005\u3068\u3057\u3066\u30ED\u30B0\u30A4\u30F3\u304C\u5FC5\u8981\u3067\u3059"
    end
  end

  def authenticate_child!
    unless child_signed_in?
      redirect_to new_children_session_path, alert: "\u30ED\u30B0\u30A4\u30F3\u304C\u5FC5\u8981\u3067\u3059"
    end
  end
end
