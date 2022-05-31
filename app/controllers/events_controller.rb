class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]

  def show
  @booking = Booking.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    if @event.save
      redirect_to dashboard_path, notice: "You have create a new event"
    else
      render 'events/new', status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:events).permit(:id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
