class BookingsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
    if @event.bookings.count >= @event.capacity
      render 'events/show', status: :unprocessable_entity
    elsif @booking.save
      redirect_to event_path(@event), notice: "You made a reservation for #{@booking.nb_guest} people"
    elsif render 'events/show', status: :unprocessable_entity
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

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboard_path
    else
      render 'dashboard', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:nb_guest, :id, :confirmation, :event_id, :user_id)
  end
end
