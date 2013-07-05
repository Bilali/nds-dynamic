require 'spec_helper'

describe "applying to be a mentor" do
  it "allows guest to apply to be a mentor" do
    visit "/"

    click_on "Become a Mentor"

    fill_in "Name", with: "Njeri Chelimo"
    fill_in "Company", with: "Nairobi Dev School"
    fill_in "Email", with: "dev@nds.org"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
