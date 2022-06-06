class NetworksController < ApplicationController

  def show
  @network = Network.find(params[:id])
  @networks_user = NetworksUser.all.reject { |network_user| network_user.user == current_user}
  @user = User.all
  @events = Event.all
  @booking = Booking.new
  end
end
