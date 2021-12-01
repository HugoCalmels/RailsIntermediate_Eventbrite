class AttendancesController < ApplicationController
  before_action :current_event, only: [:show, :edit, :update, :destroy]
  before_action :current_attendance, only: [:destroy]

  def create
    if current_user.nil?
      redirect_to new_user_session_path

    elsif (current_user.first_name == "" || current_user.first_name == nil) ||
      (current_user.last_name == "" || current_user.last_name == nil)
      redirect_to edit_user_registration_path
    elsif current_event.attendances.find_by(user: current_user)
      redirect_to event_path(current_event.id)
    else
    @attendance = Attendance.new(
      user: current_user,
      event: current_event
    )
    @attendance.save
    redirect_to event_path(current_event)
    end

  end

  def destroy

    if current_event.organizer.id == current_user.id
      redirect_to event_path(current_event.id)
    else
    @attendance.destroy
    redirect_to event_path(current_event)
    end
  end

  def show
  end

  private

  def current_event
    @event = Event.find(params[:event_id])
  end

  def current_attendance
    puts "MMMMMMMMMMMMMMM"
    puts "THIS IS WHEN WE REACHED **Current_attendance**"
    puts "MMMMMMMMMMMMMMM"
    @attendance = current_event.attendances.find_by(user: current_user)
  end
    
end
