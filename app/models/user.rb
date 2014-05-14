class User < ActiveRecord::Base
  has_secure_password

  has_many :owned_emails, foreign_key: :owner_id, class_name: "Email"

  # If password_confirmation is passed, business as usual.
  # If not, don't run the validations
  def should_confirm_password?
    password_confirmation.present?
  end

end
