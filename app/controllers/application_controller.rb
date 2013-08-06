class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :basic_authentication

  protected

  def after_sign_in_path_for(resource_or_scope)
    "/"
  end

  def basic_authentication
    return if Rails.env.development? || Rails.env.test?

    authenticate_or_request_with_http_basic do |username, password|
      username == "nds" && password == "nairobi_dev_school!"
    end
  end
end
