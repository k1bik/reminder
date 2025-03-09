class AddRecipientEmailToReminderRecord < ActiveRecord::Migration[7.2]
  def change
    add_column :reminders, :recipient_email, :string, null: false
  end
end
