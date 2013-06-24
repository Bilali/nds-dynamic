class HomeController < ApplicationController
  def index
    @waiting_list_application = WaitingListApplication.new
  end
end
