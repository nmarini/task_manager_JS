class Task < ApplicationRecord
    has_many :users_task
    has_many :users, through: :users_task
    belongs_to :list
    
    def status
        users_task ? "Complete" : "Incomplete"
    end 
    
end
