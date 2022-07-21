class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    if params[:address].present?
      sql_query = <<~SQL
        events.address ILIKE :query
      SQL
      @events = Event.where(sql_query, query: "%#{params[:address]}%")
    else
      @events = Event.all
    end

    @booking = Booking.new
    @event = Event.all
  end

  def show
    @booking = Booking.new
    @event = Event.find(params[:id])
    @markers = [
      {
        lat: @event.latitude,
        lng: @event.longitude
      }
    ]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_create)
    @event.user = current_user
    if @event.save
      redirect_to profile_path
    else
      render 'events/new', status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to profile_path
  end

  private

  def params_create
    params.require(:event).permit(:title, :experience, :address, :description, :date, :language, :capacity, :user_id, :query)
  end

  def event_params
    params.require(:events).permit(:id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
