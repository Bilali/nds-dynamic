class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin?
      admin_attendee_applications_path
    else
      root_path
    end
  end
end
