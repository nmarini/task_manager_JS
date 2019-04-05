class User < ApplicationRecord
    validates :password, confirmation: true
    validates :name, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true


    has_secure_password 

    has_many :lists
    has_many :users_task
    has_many :tasks, through: :users_task

    def self.find_or_create_by_omniauth(auth_hash)
        where(email: auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex 
            user.name = auth_hash["info"]["name"]
        end  
    end

    def unaccepted_users_tasks
        UsersTask.unaccepted_by_user(self)
    end 

    # def accepted_tasks 
    #     tasks.collect do |task| 
    #         if task.user_accepted(self) 
    #             task
    #         end 
    #     end 
    # end 
    
    def list_tasks(user_list)
        if lists.include?(user_list)
            user_list.tasks 
        else
            []
        end 
    end 


end
