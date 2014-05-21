class UsersController < ApplicationController

  respond_to :json

  def show
    user = User.all.first
    respond_with(user)
  end

  def create
    user = User.create(user_params)
    respond_with(user, location: user)
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :password)
  end

end
