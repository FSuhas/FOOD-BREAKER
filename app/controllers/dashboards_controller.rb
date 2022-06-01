class DashboardsController < ApplicationController

  def dashboard
    @event = current_user.events
  end
end
