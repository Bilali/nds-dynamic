require 'spec_helper'

describe "donating a cent or two and moving indigogo campaign to site", js: true do
  it "allows guest to make a donation" do
    visit root_path
    within ".actionable-buttons" do
      click_on "Donate"
    end
    # at this point user is redirected to paypal
    expect(page).to have_title("Billing Information - PayPal")
    # We definitely Paypal won't go down at this point.
  end

end