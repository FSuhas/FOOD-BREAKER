class DashboardsController < ApplicationController

  def dashboard
    @event = current_user.events
    @booking = current_user.bookings
  end
end
