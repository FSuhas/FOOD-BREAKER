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

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmation = true
    @event = Event.find(params[:event_id])
    if @event.calcul_capacity_book >= @booking.nb_guest
      @booking.update(confirmation: true)
    else
      render 'dashboard', status: :unprocessable_entity
    end
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:nb_guest, :id, :confirmation, :event_id, :user_id)
  end
end
