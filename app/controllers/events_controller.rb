class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit]

  def show
  @booking = Booking.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.save!
  end

  private

  def event_params
    params.require(:events).permit(:id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
