require 'spec_helper'

describe "applying to be a attendee" do
  it "allows guest to apply to be a attendee" do
    visit "/"

    within ".top-bar" do
      click_on "Apply to Attend"
    end

    fill_in "Name", with: "Njeri Chelimo"
    fill_in "Email", with: "dev@nds.org"
    fill_in "Reason for applying", with: "Cause NDS is awesome!"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end