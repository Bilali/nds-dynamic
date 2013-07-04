require 'spec_helper'

describe "viewing static content" do
  it "has content on the main site" do
    visit '/'

    expect(page).to have_content "Nairobi Dev School"

    expect(page).to have_link "Apply to Attend"    

    expect(page).to have_content "Nairobi Dev School"
  end
end
