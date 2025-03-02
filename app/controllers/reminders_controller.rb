class RemindersController < ApplicationController
  def new
    reminder = ReminderRecord.new

    respond_to do |f|
      f.html { render :new, locals: { reminder: } }
    end
  end

  def create
    permitted = params.require(:reminder).permit(:text, :reminder_time)

    reminder = ReminderRecord.new(permitted)

    if reminder.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, locals: { reminder: }
    end
  end
end
