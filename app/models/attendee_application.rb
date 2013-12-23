class AttendeeApplication < Application
  REQUIRED_ATTRS = [:name, :email, :reason_for_applying]
  ADDITIONAL_ATTRS = [:twitter, :what_to_do_after_nds, :github_or_bitbucket_profile]

  validates(*REQUIRED_ATTRS, :presence => true)

end
