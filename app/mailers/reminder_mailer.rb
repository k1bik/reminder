class ReminderMailer < ApplicationMailer
  def reminder_email(recipient_email:, reminder_id:)
    reminder = ReminderRecord.find(reminder_id)

    mail(to: recipient_email, subject: "Напоминание") do |f|
      f.html { render "reminder_mailer/reminder_email", locals: { reminder: } }
    end
  end
end
