require 'spec_helper'

describe WaitingListApplicationsController do
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }

  describe "post #create" do
    let(:valid_params) { {:name => name, :email => email} }

    it "creates an WaitingListApplication" do
      expect {
        post :create, :waiting_list_application => valid_params
      }.to change{ WaitingListApplication.count }.by(1)

      application = WaitingListApplication.last
      expect(application.name).to eq(name)
      expect(application.email).to eq(email)
    end

    it "redirects to the root" do
      post :create, :waiting_list_application => valid_params

      expect(response).to redirect_to(root_path)
    end

    it "sets a flash" do
      post :create, :waiting_list_application => valid_params

      expect(flash[:success]).to be_present
    end
  end
end
