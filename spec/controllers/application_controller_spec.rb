require 'spec_helper'

class TestController < ApplicationController
  def some_route
    render nothing: true
  end
end

describe TestController do
  before :each do
    Rails.application.routes.draw do
      get 'some_route' => "test#some_route"
    end
  end

  after :each do
    Rails.application.reload_routes!
  end

  describe "authentication" do
    before :each do
      @old_env = Rails.env
      Rails.env = env
    end

    after :each do
      Rails.env = @old_env
    end

    context "production" do
      let(:env) { "production" }

      it "doesn't require auth" do
        get :some_route 
        expect(response).to be_success
      end
    end

    context "development" do
      let(:env) { "development" }

      it "doesn't require authentication" do
        get :some_route
        expect(response).to be_success
      end
    end

    context "staging" do
      let(:env) { "staging" }
      
      it "requires basic auth" do
        get :some_route
        expect(response).to_not be_success
      end
    end
  end
end
