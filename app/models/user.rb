class User < ActiveRecord::Base
  has_secure_password

  # TODO: I think making the association "owned_emails" was a mistake.
  #       Instead it should just be "emails", which will include
  #       both owned and those that the user has access to. 
  #       A seperate query on /emails/ can be used to see what emails a 
  #       given user owns.
  has_many :owned_emails, foreign_key: :owner_id, class_name: "Email"
  has_many :access_tokens

  validates :username, allow_blank: true, uniqueness: {case_sensitive: false}
  validate :has_email_or_username

  attr_accessor :skip_email_check

  # If password_confirmation is passed, business as usual.
  # If not, don't run the validations
  def should_confirm_password?
    password_confirmation.present?
  end

  def has_email_or_username
    if !(username or owned_emails.any?) and not skip_email_check
      errors.add(:username, "required if no emails")
    else
      true
    end
  end


end
