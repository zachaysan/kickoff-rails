class UsersController < ApplicationController

  respond_to :json

  def show
    user = User.all.first
    respond_with(user)
  end

  def create
    params = user_params
    address = params.delete("email")
    user = User.new(params)

    if address
      User.transaction do
        user.skip_email_check = true
        user.save!
        email = Email.new({ address: address })
        email.owner = user
        email.save!
      end
    else
      user = User.create!(params)
    end
    respond_with(user)
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :username,
                                 :password)
  end

end
