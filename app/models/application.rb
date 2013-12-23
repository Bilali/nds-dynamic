class Application < ActiveRecord::Base
  after_save :send_email_acknowledgement

  private

  def send_email_acknowledgement
    StudentMailer.application_confirmed(self).deliver
  end
end
