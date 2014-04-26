require 'spec_helper'

describe "applying to be a sponsor" do
  it "allows guest to apply to be a sponsor" do
    visit "/"

    click_on "Sponsor"

    within('form') do
      fill_in "Name",              with: "Njeri Chelimo"
      fill_in "Email",             with: "dev@nds.org"
      fill_in "Company",           with: "Nairobi Dev School"
      fill_in "Twitter",           with: "@njeri"
      fill_in "Address line 1",    with: "Address line 1"
      fill_in "Address line 2",    with: "Address line 2"
      fill_in "City",              with: "Nairobi"
      fill_in "State/Province",    with: "Kenya"
      fill_in "Postcode/Zip Code", with: "some african zip?"
      fill_in "Phone",             with: "303-555-0123"

      click_on "Apply"
    end

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
