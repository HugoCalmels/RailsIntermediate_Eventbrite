class AttendancesController < ApplicationController
  before_action :current_event, only: [:show, :edit, :update, :destroy]
  before_action :current_attendance, only: [:destroy]

  def create


    if current_event.attendances.find_by(user: current_user)
      puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
      puts "NNOOOOOOTTTT SAVED"
      array = current_event.attendances.map do |el|
        puts el.user.email
        puts el.user.id
        puts current_user.id
        puts current_event.attendances
      end
      puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
      redirect_to event_path(current_event.id)
    else
    
    @attendance = Attendance.new(
      user: current_user,
      event: current_event
    )
    @attendance.save
    redirect_to event_path(current_event)
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    puts "ATTENDANCE SAVED"
    puts "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    end

  end

  def destroy
    puts "MMMMMMMMMMMMMMM"
    puts "THIS IS WHEN WE REACHED **destroy_method**"
    puts "MMMMMMMMMMMMMMM"
    @attendance.destroy
    redirect_to event_path(current_event)
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
