class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :note, :completed

  has_many :users_task
  has_many :users, through: :users_task 
  belongs_to :list
end
