class Task < ApplicationRecord
    has_many :users_task
    has_many :users, through: :users_task
    belongs_to :list

    def self.completed_tasks
        where(completed: true)
    end

    def self.incomplete_tasks
        where(completed: false)
    end 
    
end
