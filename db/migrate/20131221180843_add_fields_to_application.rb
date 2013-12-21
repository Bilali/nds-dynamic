class AddFieldsToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :what_to_do_after_nds, :text
    add_column :applications, :can_pay_fees, :boolean
    add_column :applications, :reason_for_sponsorship, :text
  end
end
