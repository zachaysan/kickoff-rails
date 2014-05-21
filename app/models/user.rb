class User < ActiveRecord::Base
  has_secure_password

  has_many :owned_emails, foreign_key: :owner_id, class_name: "Email"
  has_many :access_tokens

  validates :username, allow_blank: true, uniqueness: {case_sensitive: false}
  validate :has_email_or_username

  # If password_confirmation is passed, business as usual.
  # If not, don't run the validations
  def should_confirm_password?
    password_confirmation.present?
  end

  def has_email_or_username
    if !(username or owned_emails.any?)
      errors.add(:username, "required if no emails")
    else
      true
    end
  end

end
