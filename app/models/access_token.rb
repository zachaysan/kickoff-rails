class AccessToken < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :token
  validates_presence_of :user

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex
  end

end
