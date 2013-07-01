class Admin::WaitingListApplicationsController < Admin::BaseController
  def index
    @waiting_list_applications = WaitingListApplication.all
  end
end
