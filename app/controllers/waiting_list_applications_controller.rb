class WaitingListApplicationsController < ApplicationController
  def create
    @waiting_list_application = WaitingListApplication.new(application_params)

    if @waiting_list_application.save
      flash[:success] = I18n.t("waiting_list_applications.create.success")
      redirect_to :back
    else
      flash[:error] = I18n.t("waiting_list_applications.create.failure")
      render :new
    end
  end

  def new
    @waiting_list_application = WaitingListApplication.new
  end

  def application_params
    params.require(:waiting_list_application)
          .permit(*WaitingListApplication::REQUIRED_ATTRS)
  end
end
