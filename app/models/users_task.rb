class UsersTask < ApplicationRecord
    belongs_to :user 
    belongs_to :task 

    def self.unaccepted_by_user(user)
        false_accepted.select{|users_task| users_task.user_id == user.id}
    end 

    def self.false_accepted
        UsersTask.where(accepted: false)
    end 
end
