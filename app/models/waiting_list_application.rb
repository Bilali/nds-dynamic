class WaitingListApplication < Application
  REQUIRED_ATTRS = [:name, :email]
  ADDITIONAL_ATTRS = []
  validates(*REQUIRED_ATTRS, :presence => true)
end
