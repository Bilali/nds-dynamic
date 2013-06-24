class CreateWaitingListApplications < ActiveRecord::Migration
  def change
    create_table :waiting_list_applications do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
