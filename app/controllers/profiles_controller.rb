class ProfilesController < ApplicationController

  def profile
    @user = current_user
    @event = current_user.events
  end
end
