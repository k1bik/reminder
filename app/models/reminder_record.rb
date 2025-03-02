class ReminderRecord < ApplicationRecord
  self.table_name = :reminders

  validates :reminder_time, presence: true, comparison: { greater_than: -> { DateTime.current } }
  validates :text, presence: true

  def start_time
    reminder_time
  end

  def end_time
    reminder_time + 300 # 5 мин
  end
end
