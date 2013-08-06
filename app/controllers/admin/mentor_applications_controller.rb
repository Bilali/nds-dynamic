class Admin::MentorApplicationsController < Admin::BaseController
  def index
    @mentor_applications = MentorApplication.all
  end
end
