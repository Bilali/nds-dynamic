require 'spec_helper'

class Admin::TestController < Admin::BaseController
  def show
    render nothing: true
  end
end

describe Admin::TestController do
  before do
    Rails.application.routes.draw do
      get '/some_action' => "admin/test#show"
    end
  end

  after do
    Rails.application.reload_routes!
  end

  it "requires authentication" do
    get :show
    expect(response).to be_redirect
    expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
  end
end
