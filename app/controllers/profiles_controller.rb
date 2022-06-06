class ProfilesController < ApplicationController

  def profile
    @user = current_user
    @event = current_user.events
  end

  def show
    @user = User.find(params[:id])
    @event = @user.events
  end

  def bio
    @bio = current_user.bio
  end

  def update
    bio.save
    redirect_to profile_path
  end
end
