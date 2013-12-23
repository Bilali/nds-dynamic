class AttendeeApplication < Application
  after_save :send_email_acknowledgement

  REQUIRED_ATTRS = [:name, :email, :reason_for_applying]
  ADDITIONAL_ATTRS = [:twitter, :what_to_do_after_nds, :github_or_bitbucket_profile]

  validates(*REQUIRED_ATTRS, :presence => true)

  resourcify

  private
  def send_email_acknowledgement
    StudentMailer.application_confirmed(self).deliver
  end
end
