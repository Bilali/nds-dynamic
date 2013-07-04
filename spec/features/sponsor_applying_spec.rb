require 'spec_helper'

describe "applying to be a sponsor" do
  it "allows guest to apply to the waiting list" do
    visit "/"

		click_on "Become a Sponsor"

    fill_in "Your name", with: "Njeri Chelimo"
		fill_in "Your company", with: "Nairobi Dev School"
    fill_in "Your email", with: "dev@nds.org"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
