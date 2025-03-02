class CalendarController < ApplicationController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    reminders = ReminderRecord.where(reminder_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    respond_to do |f|
      f.html { render :index, locals: { reminders: } }
    end
  end
end
