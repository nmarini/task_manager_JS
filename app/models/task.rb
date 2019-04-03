class Task < ApplicationRecord
    validates :title, presence: true

    has_many :users_task
    has_many :users, through: :users_task
    belongs_to :list

    def status
        completed ? "Complete" : "Incomplete"
    end 

    def accepted
        users_task.accepted
    end 
    
end
