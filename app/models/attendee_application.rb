class AttendeeApplication < Application
  REQUIRED_ATTRS = [:name, :email]
  ADDITIONAL_ATTRS = [:reason_for_applying]

  validates(*REQUIRED_ATTRS, :presence => true)
end
