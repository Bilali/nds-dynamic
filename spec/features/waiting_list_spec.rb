require 'spec_helper'

describe "applying to the waiting list" do
  xit "allows guest to apply to the waiting list" do
    visit "/"

    fill_in "Your name", with: "Njeri Chelimo"
    fill_in "Your email", with: "dev@nds.org"

    click_on "Join the waiting list"

    expect(page).to have_content("Thanks for joining! Please check your email.")
  end
end
