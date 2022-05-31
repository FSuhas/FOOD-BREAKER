class BookingsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
    if @booking.save
      redirect_to event_path(@event), notice: "You made a reservation for #{@booking.nb_guest} people"
    else
      render 'events/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:nb_guest)
  end
end
