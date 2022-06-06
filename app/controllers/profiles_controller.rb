class ProfilesController < ApplicationController

  def profile
    @user = current_user
    @event = current_user.events
  end

  def show
    @user = User.find(params[:id])
    @event = @user.events
  end
end
