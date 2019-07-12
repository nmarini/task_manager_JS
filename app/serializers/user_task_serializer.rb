class UserTaskSerializer < ActiveModel::Serializer
  attributes :id, :accepted

  belongs_to :user
  belongs_to :task
end
