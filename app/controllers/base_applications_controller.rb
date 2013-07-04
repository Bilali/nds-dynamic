class BaseApplicationsController < ApplicationController
	def self.model(model_name)
		@model_name = model_name	
		@model_class = model_name.to_s.camelize.constantize
	end

	def new
    set_model(model_class.new)
	end

  def create
    set_model(model_class.new(application_params))

    if model.save
      flash[:success] = I18n.t("applications.create.success")
      redirect_to root_path
    else
      flash[:error] = I18n.t("applications.create.failure")
      render :new
    end
  end

	private

	def set_model(value)
		instance_variable_set(:"@#{model_name}", value)
	end

	def model
		instance_variable_get("@#{model_name}")
	end

	def model_name
		self.class.instance_variable_get(:@model_name)	
	end

	def model_class
		self.class.instance_variable_get(:@model_class)	
	end

  def application_params
    params.require(model_name)
          .permit(*model_class.const_get("REQUIRED_ATTRS"))
  end
end
