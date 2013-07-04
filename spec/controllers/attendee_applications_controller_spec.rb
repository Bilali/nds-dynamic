require 'spec_helper'

describe AttendeeApplicationsController do
	let(:name) { Faker::Name.name }
	let(:email) { Faker::Internet.email }

	describe "post #create" do
		let(:valid_params) do 
			{
				:name => name, 
				:email => email,
			} 
		end

		let(:good_request) do
			post :create, :attendee_application => valid_params
		end

		context "success" do
			it "creates an AttendeeApplication" do
				expect {
					good_request
				}.to change{ AttendeeApplication.count }.by(1)

				application = AttendeeApplication.last
				expect(application.name).to eq(name)
				expect(application.email).to eq(email)
			end

			it "redirects to the last url" do
				good_request

				expect(response).to redirect_to(root_path)
			end

			it "sets a flash" do
				good_request

				expect(flash[:success]).to be_present
			end
		end

		context "failure" do
			let(:bad_request) do
				post :create, :attendee_application => {:name => "", :email => ""}
			end

			it "doesn't create a attendee application" do
				expect {
					bad_request
				}.not_to change{ AttendeeApplication.count }.by(1)
			end

			it "has errors on the model" do
				bad_request

				expect(
					assigns[:attendee_application].errors
				).not_to be_empty
			end

			it "sets a failure flash" do
				bad_request

				expect(flash[:error]).to be_present
			end

			it "renders the new action" do
				bad_request

				expect(response).to render_template(:new)
			end
		end
	end
end
