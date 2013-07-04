class SponsorApplicationsController < ApplicationController
	def new
		@sponsor_application = SponsorApplication.new
	end

  def create
    @sponsor_application = SponsorApplication.new(application_params)

    if @sponsor_application.save
      flash[:success] = I18n.t("applications.create.success")
      redirect_to root_path
    else
      flash[:error] = I18n.t("applications.create.failure")
      render :new
    end
  end

  def application_params
    params.require(:sponsor_application)
          .permit(*SponsorApplication::REQUIRED_ATTRS)
  end
end
