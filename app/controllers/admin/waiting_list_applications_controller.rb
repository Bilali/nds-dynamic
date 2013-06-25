class Admin::WaitingListApplicationsController < ApplicationController
  def index
    @waiting_list_applications = WaitingListApplication.all
  end
end
