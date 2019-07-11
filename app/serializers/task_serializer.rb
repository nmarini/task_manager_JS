class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :note, :list_id, :completed

  has_many :user_tasks
  has_many :users, through: :user_tasks 
  belongs_to :list
end
