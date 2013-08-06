require 'spec_helper'

feature "waiting lists applications" do
  scenario "viewing waiting lists applications by admin" do
    build_applications
    
    sign_in

    click_on "Attendee Applications"

    expect(page).to have_content "An Attendee Applicant"
    expect(page).to have_content "some@attendee.com"

    expect(page).to have_content "Another Attendee Applicant"
    expect(page).to have_content "another@attendee.com"
    
    click_on "Mentor Applications"
    
    expect(page).to have_content "A Mentor Applicant"
    expect(page).to have_content "some@mentor.com"

    expect(page).to have_content "Another Mentor Applicant"
    expect(page).to have_content "another@mentor.com"
    
    click_on "Sponsor Applications"
    
    expect(page).to have_content "A Sponsor Applicant"
    expect(page).to have_content "some@sponsor.com"

    expect(page).to have_content "Another Sponsor Applicant"
    expect(page).to have_content "another@sponsor.com"
  end
end

def build_applications
  FactoryGirl.create(:attendee_application,
                     :name => "An Attendee Applicant",
                     :email => "some@attendee.com")
  
  FactoryGirl.create(:attendee_application,
                     :name => "Another Attendee Applicant",
                     :email => "another@attendee.com")
  
  FactoryGirl.create(:mentor_application,
                     :name => "A Mentor Applicant",
                     :email => "some@mentor.com")
  
  FactoryGirl.create(:mentor_application,
                     :name => "Another Mentor Applicant",
                     :email => "another@mentor.com")
  
  FactoryGirl.create(:sponsor_application,
                     :name => "A Sponsor Applicant",
                     :email => "some@sponsor.com")
  
  FactoryGirl.create(:sponsor_application,
                     :name => "Another Sponsor Applicant",
                     :email => "another@sponsor.com")
end


def sign_in
  user = FactoryGirl.create(:user,
                            email: "user@nds.com",
                            password: "password")
  user.add_role "admin"

  visit "/users/sign_in"

  fill_in "Email",    with: "user@nds.com"
  fill_in "Password", with: "password"

  click_on "Sign in"

  expect(page).to have_content "Signed in successfully"
end

