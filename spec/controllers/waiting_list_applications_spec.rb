require 'spec_helper'

describe WaitingListApplicationsController do
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }

  describe "post #create" do
    let(:valid_params) { { :name => name, :email => email } }
    let(:good_request) do
      post :create, :waiting_list_application => valid_params
    end

    context "success" do
      it "creates an WaitingListApplication" do
        expect {
          good_request
        }.to change{ WaitingListApplication.count }.by(1)

        waiting_list_application = WaitingListApplication.last
        expect(waiting_list_application.name).to eq(name)
        expect(waiting_list_application.email).to eq(email)
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
        post :create, :waiting_list_application => {:name => "", :email => ""}
      end

      it "doesn't create a waiting list application" do
        expect {
          bad_request
        }.not_to change{ WaitingListApplication.count }.by(1)
      end

      it "has errors on the model" do
        bad_request

        expect(
          assigns[:waiting_list_application].errors
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
