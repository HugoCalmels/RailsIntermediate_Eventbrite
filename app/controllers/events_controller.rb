class EventsController < ApplicationController
  def index
  end

  def show
    @events = Event.all
  end

  def new
    if !current_user
      redirect_to new_user_session_path
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
    
    if @event.save
      redirect_to root_path
    else
      @event.errors.full_messages
      render "new"
    end
  end
end
