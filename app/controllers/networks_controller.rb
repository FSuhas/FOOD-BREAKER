class NetworksController < ApplicationController

  def show
  @network = Network.find(params[:id])
  @network_user = NetworksUser.all
  end
end
