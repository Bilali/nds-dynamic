class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :basic_authentication

  protected

  def after_sign_in_path_for(resource_or_scope)
    admin_waiting_list_applications_path
  end

  def basic_authentication
    return unless Rails.env.staging?

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["STAGING_USERNAME"] && password == ENV["STAGING_PASSWORD"]
    end
  end
end
