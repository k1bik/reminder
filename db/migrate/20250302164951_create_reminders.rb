class CreateReminders < ActiveRecord::Migration[7.2]
  def change
    create_table :reminders do |t|
      t.text :text, null: false
      t.datetime :reminder_time, null: false
      t.timestamps
    end
  end
end
