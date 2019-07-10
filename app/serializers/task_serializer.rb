class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :note, :list_id, :completed
end
