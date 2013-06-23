require 'spec_helper'

describe "viewing static content" do
  it "has content on the main site" do
    visit '/'

    expect(page).to have_content "Nairobi Dev School"

    expect(page).to have_link "Our Story"    
    expect(page).to have_link "Register"    

    expect(page).to have_content "Collaborative Learning"
  end
end
