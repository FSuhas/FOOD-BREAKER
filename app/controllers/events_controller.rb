class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]

  def index
    @event = Event.new
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
      redirect_to dashboard_path, notice: "You have create a new event"
    else
      render 'events/new', status: :unprocessable_entity
    end
  end

  private

  def params_create
    params.require(:event).permit(:title, :experience, :address, :description, :date, :language, :capacity, :user_id)
  end

  def event_params
    params.require(:events).permit(:id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
