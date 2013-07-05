class AddReasonForApplyingToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :reason_for_applying, :text
  end
end
