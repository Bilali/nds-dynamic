require 'spec_helper'

feature "waiting lists applications" do
  scenario "viewing waiting lists applications by admin" do
    pending('need to do')
    user = FactoryGirl.create(:user,
                               email: "user@nds.com",
                               password: "password")
    user.add_role "admin"

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
  visit "/users/sign_in"

  fill_in "Email",    with: "user@nds.com"
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
