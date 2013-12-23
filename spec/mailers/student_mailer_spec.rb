require "spec_helper"

describe StudentMailer do
  describe "application_confirmation" do
    let(:mail) { StudentMailer.application_confirmed(double(name: "john", email: "to@example.com")) }

    it "renders the headers" do
      mail.subject.should eq("Application confirmed")
      mail.to.should eq(["to@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
