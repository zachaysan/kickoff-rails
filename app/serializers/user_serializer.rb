class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :username, :created_at, :updated_at

  has_many :owned_emails
end
