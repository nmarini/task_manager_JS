class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id

  has_many :tasks
  belongs_to :user
end
