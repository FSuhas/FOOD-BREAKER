class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def profile
    @user = current_user
    @event = current_user.events
  end

  def show
    @event = @user.events
  end

  def edit
  end

  def update

    if current_user.update(params_create)

      redirect_to profile_path
    else

      render profile_path, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/profile').permit(:id, :email, :nickname, :avatar, :address, :bio, :photo )
  end
end
