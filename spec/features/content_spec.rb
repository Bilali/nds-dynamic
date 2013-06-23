require 'spec_helper'

describe "viewing static content" do
  it "has content on the main site" do
    visit '/'

    expect(page).to have_content "Hello"    
  end
end
