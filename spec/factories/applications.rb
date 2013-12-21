FactoryGirl.define do
  factory :attendee_application do
    name  "An attendee"
    email "student@nds.org"
    reason_for_applying "This is a reason for applying"
  end

  factory :mentor_application do
    name  "A mentor"
    email "user@nds.org"
  end

  factory :sponsor_application do
    name              "A sponsor"
    company           "A company"
    email             "user@nds.org"
    address_line_1    "Address line 1"
    city              "city"
    state_or_province "state"
  end
end
