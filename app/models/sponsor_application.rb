class SponsorApplication < Application
  REQUIRED_ATTRS = [:name,
                    :email,
                    :company,
                    :address_line_1,
                    :address_line_2,
                    :city,
                    :state_or_province]
  
  ADDITIONAL_ATTRS = [:twitter,
                      :phone,
                      :postcode]

  validates(*REQUIRED_ATTRS, :presence => true)
end
