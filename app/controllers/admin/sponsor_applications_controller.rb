class Admin::SponsorApplicationsController < Admin::BaseController
  def index
    @sponsor_applications = SponsorApplication.all
  end
end
