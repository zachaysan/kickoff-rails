class Email < ActiveRecord::Base

  belongs_to :owner, foreign_key: :owner_id, class_name: "User"

  validates_presence_of :address
  validates_presence_of :owner_id

  alias_attribute :email, :address

end
