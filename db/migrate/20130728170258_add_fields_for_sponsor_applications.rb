class AddFieldsForSponsorApplications < ActiveRecord::Migration
  def change
    add_column "applications", "twitter", :string
    add_column "applications", "address_line_1", :string
    add_column "applications", "address_line_2", :string
    add_column "applications", "city", :string
    add_column "applications", "state_or_province", :string
    add_column "applications", "postcode", :string
    add_column "applications", "phone", :string
  end
end
