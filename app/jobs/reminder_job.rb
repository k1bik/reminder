class ReminderJob
  include Sidekiq::Job

  sidekiq_options queue: :mailers

  def perform(reminder_id)
    reminder = ReminderRecord.find_by(id: reminder_id)

    return if reminder.nil? || reminder.has_been_sent?

    reminder.update_column(:sent_at, Time.current)
    ReminderMailer.reminder_email(recipient_email: reminder.recipient_email, reminder_id:).deliver_later
  end
end
