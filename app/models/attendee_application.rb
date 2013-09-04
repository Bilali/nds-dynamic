class AttendeeApplication < Application
  REQUIRED_ATTRS = [:name, :email]
  ADDITIONAL_ATTRS = [:reason_for_applying, :youtube_or_vimeo_link, :github_or_bitbucket_profile]

  validates(*REQUIRED_ATTRS, :presence => true)

  resourcify
end
