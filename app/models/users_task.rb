class UsersTask < ApplicationRecord
    belongs_to :user 
    belongs_to :task 

    def self.unaccepted_by_user(user)
        UsersTask.where(accepted: false).select{ |users_task| users_task.user_id == user.id}
    end 
end
