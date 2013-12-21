require 'spec_helper'

describe "applying to be a attendee" do
  it "allows guest to apply to be a attendee" do
    visit "/"

    within ".top-bar" do
      click_on "Apply to Attend"
    end

    fill_in "Name", with: "Njeri Chelimo"
    fill_in "Email", with: "dev@nds.org"
    fill_in "Twitter", with: "twitter_handle"
    fill_in("Reason for applying. Please say a few sentences",
            with: "Cause NDS is awesome!")
    fill_in "What would you like to do after NDS?", with: "Save the world"
    check("I can afford the $636 batch fee")
    fill_in "If you can't afford the batch fee please tell us why you need help!", with: "I need help!"

    click_on "Apply"

    expect(page).to have_content("Thanks for applying! Please check your email.")
  end
end
