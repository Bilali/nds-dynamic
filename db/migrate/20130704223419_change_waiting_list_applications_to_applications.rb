class ChangeWaitingListApplicationsToApplications < ActiveRecord::Migration
  def change
		rename_table :waiting_list_applications, :applications
  end
end
