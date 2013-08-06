require 'spec_helper'

describe SponsorApplicationsController do
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }
  let(:company) { Faker::Name.name }
  let(:address_line_1) { Faker::Address.street_name }
  let(:city) { Faker::Address.city }
  let(:state) { Faker::Address.state }

  describe "post #create" do
    let(:valid_params) do 
      {
        :name => name, 
        :company => company, 
        :email => email,
        :address_line_1 => address_line_1,
        :city => city,
        :state_or_province => state
      } 
    end

    let(:good_request) do
      post :create, :sponsor_application => valid_params
    end

    context "success" do
      it "creates an SponsorApplication" do
        expect {
          good_request
        }.to change{ SponsorApplication.count }.by(1)

        application = SponsorApplication.last
        expect(application.name).to eq(name)
        expect(application.company).to eq(company)
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
        post :create, :sponsor_application => {:name => "", :email => ""}
      end

      it "doesn't create a sponsor application" do
        expect {
          bad_request
        }.not_to change{ SponsorApplication.count }.by(1)
      end

      it "has errors on the model" do
        bad_request

        expect(
          assigns[:sponsor_application].errors
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
