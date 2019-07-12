class ListSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :tasks
  belongs_to :user
end
