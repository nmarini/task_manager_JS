class User < ApplicationRecord
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
    
    def list_tasks(list)
        list.tasks 
    end 
end
