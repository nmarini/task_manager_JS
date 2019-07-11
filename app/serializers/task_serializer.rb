class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :note, :list_id, :completed

  has_many :users_task
  has_many :users, through: :users_task 
  belongs_to :list
end
