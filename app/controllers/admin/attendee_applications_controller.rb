class Admin::AttendeeApplicationsController < Admin::BaseController
  def index
    @attendee_applications = AttendeeApplication.all
  end
end
