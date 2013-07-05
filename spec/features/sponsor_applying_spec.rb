require 'spec_helper'

describe "applying to be a sponsor" do
  it "allows guest to apply to be a sponsor" do
    visit "/"

    click_on "Become a Sponsor"

    fill_in "Name", with: "Njeri Chelimo"
    fill_in "Company", with: "Nairobi Dev School"
    fill_in "Email", with: "dev@nds.org"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
