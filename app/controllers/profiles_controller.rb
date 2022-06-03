class ProfilesController < ApplicationController

  def profile
    @user = User.all
  end
end
