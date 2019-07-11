class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :lists 
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
end
