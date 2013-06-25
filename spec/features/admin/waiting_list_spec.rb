require 'spec_helper'

feature "waiting lists applications" do
  scenario "viewing waiting lists applications" do
    admin = FactoryGirl.create(:admin,
                               email: "admin@nds.com",
                               password: "password")

    waiting_list_application = FactoryGirl.create(:waiting_list_application,
                                                  name: "An Applicant",
                                                  email: "some@email.com")

    waiting_list_application = FactoryGirl.create(:waiting_list_application,
                                                  name: "Another Applicant",
                                                  email: "another@email.com")
    sign_in

    view_waiting_list_applications
  end
end

def sign_in
  visit "/admins/sign_in"

  fill_in "Email",    with: "admin@nds.com"
  fill_in "Password", with: "password"

  click_on "Sign in"

  expect(page).to have_content "Signed in successfully"
end

def view_waiting_list_applications
  expect(page).to have_content "An Applicant"
  expect(page).to have_content "some@email.com"

  expect(page).to have_content "Another Applicant"
  expect(page).to have_content "another@email.com"
end
