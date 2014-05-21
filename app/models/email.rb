class Email < ActiveRecord::Base

  belongs_to :owner, foreign_key: :owner_id, class_name: "User"

  validates_presence_of :address
  validates_presence_of :owner_id

  alias_attribute :email, :address
  validate :address_follows_spec

  def address_follows_spec
    #TODO: Insert Justin's email validation code
  end

end
