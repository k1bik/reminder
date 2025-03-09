class ReminderObserverJob
  include Sidekiq::Job

  def perform
    reminders_ids = ReminderRecord.where("reminder_time <= ?", Time.current).pluck(:id)

    reminders_ids.each do |reminder_id|
      ReminderJob.perform_async(reminder_id)
    end
  end
end
