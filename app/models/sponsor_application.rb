class SponsorApplication < Application
  REQUIRED_ATTRS = [:name,
                    :email,
                    :company,
                    :address_line_1,
                    :city,
                    :state_or_province]

  ADDITIONAL_ATTRS = [:twitter,
                      :phone,
                      :address_line_2,
                      :postcode]

  validates(*REQUIRED_ATTRS, :presence => true)

  resourcify
end
