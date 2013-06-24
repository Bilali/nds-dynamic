class WaitingListApplicationsController < ApplicationController
  def create
    WaitingListApplication.create! application_params
    flash[:success] = I18n.t("waiting_list_applications.create.thanks")
    redirect_to root_path
  end

  def application_params
    params.require(:waiting_list_application)
          .permit(*WaitingListApplication::REQUIRED_ATTRS)
  end
end
