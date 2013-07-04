class SponsorApplication < Application
  REQUIRED_ATTRS = [
    :name, :email, :company
  ]
  validates(*REQUIRED_ATTRS, :presence => true)
end
