class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :lists 
  has_many :users_task
  has_many :tasks, through: :users_task
end
