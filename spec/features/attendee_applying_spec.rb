require 'spec_helper'

describe "applying to be a attendee" do
  xit "allows guest to apply to be a attendee" do
    visit "/"

    within ".top-bar" do
      click_on "Apply to Attend"
    end

    fill_in "Name", with: "Njeri Chelimo"
    fill_in "Email", with: "dev@nds.org"
    fill_in "Reason for applying", with: "Cause NDS is awesome!"
    fill_in "Youtube or Vimeo link", with: "http://bit.ly/2343"
    fill_in "Github or Bitbucket link/profile", with: "http://bit.ly/2234"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
