class AddTypeAndCompanyToApplications < ActiveRecord::Migration
  def change
		add_column :applications, :company, :string
		add_column :applications, :type, :string
  end
end
