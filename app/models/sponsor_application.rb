class SponsorApplication < Application
  REQUIRED_ATTRS = [:name, :email]
  ADDITIONAL_ATTRS = [:company]

  validates(*REQUIRED_ATTRS, :presence => true)
end
