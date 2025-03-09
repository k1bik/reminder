class ReminderRecord < ApplicationRecord
  self.table_name = :reminders

  validates :reminder_time, presence: true, comparison: { greater_than: -> { DateTime.current } }
  validates :text, presence: true
  validates :recipient_email, presence: true

  scope :not_sent, -> { where(sent_at: nil) }

  def start_time
    reminder_time
  end

  def has_been_sent?
    sent_at.present?
  end
end
