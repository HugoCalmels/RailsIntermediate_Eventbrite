class EventsController < ApplicationController
  before_action :current_event, only: [:show, :edit, :update, :destroy]
  before_action :current_attendance, only: [:show]

  def index
  end

  def show
    @attendances = @event.attendances
  end

  def new
    if !current_user
      redirect_to new_user_session_path, warning: "Vous devez posséder un compte, et être connecté pour créer un évènement !"
    end
  end

  def create 
    @event = Event.new(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location],
      start_date: params[:start_date],
      start_hour: params[:start_hour],
      duration: params[:duration],
      organizer: current_user
    )
    @event.avatar.attach(params[:avatar])
    
    if @event.save
      @attendance = Attendance.new(
      user: current_user,
      event: @event
      )
      @attendance.save
      redirect_to event_path(@event.id), success: "Evènement crée !"
    else
      redirect_to new_event_path, danger: @event.errors.full_messages
    end
  end

  def edit
  end
  
  def update

    if params[:title] != ''
      @event.title = params[:title]
    elsif params[:price] != '' 
      @event.price = params[:price]
    elsif params[:location] != '' 
      @event.location = params[:location]
    elsif params[:start_date] != '' 
      @event.start_date = params[:start_date]
    elsif params[:start_hour] != '' 
      @event.start_hour = params[:start_hour]
    elsif params[:duration] != "--:--" && params[:duration] != '' 
      @event.duration = params[:duration]
    elsif params[:description] != '' 
      @event.description = params[:description]
    end

    if @event.save 
      redirect_to event_path(@event.id)
    else  
      render "edit"
    end
  end

  def destroy
    @event.destroy

    redirect_to root_path
  end

  private
  
  def current_event
    @event = Event.find(params[:id])
  end

  def current_attendance
    @attendance = current_event.attendances.find_by(user: current_user)
  end
  

end
