class ReminderObserverJob
  include Sidekiq::Job

  def perform
    reminders_ids = ReminderRecord.not_sent.where("reminder_time <= ?", Time.current).pluck(:id)

    reminders_ids.each do |reminder_id|
      ReminderJob.perform_async(reminder_id)
    end
  end
end
