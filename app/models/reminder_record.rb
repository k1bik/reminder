class ReminderRecord < ApplicationRecord
  self.table_name = :reminders

  validates :reminder_time, presence: true, comparison: { greater_than: -> { DateTime.current } }
  validates :text, presence: true
end
