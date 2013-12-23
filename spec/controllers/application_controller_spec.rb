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

end
