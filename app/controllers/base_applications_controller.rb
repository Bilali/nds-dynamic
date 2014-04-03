class BaseApplicationsController < ApplicationController
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

  def model_name
    model_class.model_name.param_key
  end

  def set_model(value)
    instance_variable_set(:"@#{model_name}", value)
  end

  def model
    instance_variable_get("@#{model_name}")
  end

  def application_params
    params.require(model_name).permit(*attributes)
  end

  def attributes
    model_class.const_get("REQUIRED_ATTRS") + 
      model_class.const_get("ADDITIONAL_ATTRS")
  end
end
