class ReminderJob
  include Sidekiq::Job

  def perform(reminder_id)
    ReminderMailer.reminder_email(recipient_email: "", reminder_id:).deliver_later
  end
end
