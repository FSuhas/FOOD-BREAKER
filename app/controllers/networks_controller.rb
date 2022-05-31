class NetworksController < ApplicationController

  def show
  @network = Network.find(params[:id])
  @network_user = NetworksUser.find(params[:id])
  end
end
