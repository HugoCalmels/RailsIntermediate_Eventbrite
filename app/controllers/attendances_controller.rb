class AttendancesController < ApplicationController
  before_action :current_event, only: [:show, :edit, :update, :destroy]
  before_action :current_attendance, only: [:destroy]

  def index
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    puts params
    puts params
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    puts "MMMMMMMMMMMMMMMMMMMMMMM"
    create
  end

  def create
    if current_user.nil?
      redirect_to new_user_session_path, warning: "Vous devez posséder un compte, et être connecté pour rejoindre un évènement"

    elsif (current_user.first_name == "" || current_user.first_name == nil) 
 
      redirect_to edit_user_registration_path, warning: "Vous devez compléter votre profil pour rejoindre un évènement !"
    elsif current_event.attendances.find_by(user: current_user)
      redirect_to event_path(current_event.id), warning: "Ca s'active quand ca ?!"
    else
    @attendance = Attendance.new(
      user: current_user,
      event: current_event,
      stripe_customer_id: params[:format]
    )
    if @attendance.save
    redirect_to event_path(current_event), success: "Vous avez rejoint l'évènement #{current_event.title} !"
    end
  end
  end

  def destroy

    if current_event.organizer.id == current_user.id
      redirect_to event_path(current_event.id)
    else
    redirect_to event_path(current_event), warning: "Vous avez quitté l'évènement #{current_event.title} !"
    @attendance.destroy
    
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
