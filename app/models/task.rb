class Task < ApplicationRecord
    validates :title, presence: true

    has_many :users_task
    has_many :users, through: :users_task
    belongs_to :list

    def status
        completed ? "Complete" : "Incomplete"
    end 

    def user_accepted?(user)
        users_task.find{|user_task|user_task.user_id == user.id}.accepted
    end 

    def unaccepted_users
        users.select do |user|
            user_accepted?(user) == false
        end 
    end 
    
    def completed_label
        completed ?  "Completed" : "Update Status"
    end 

    def completed_klass
        completed ?  "text-success" : "text-danger"
    end 
    
end
