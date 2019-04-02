class List < ApplicationRecord
    has_many :tasks 
    belongs_to :user

    def list_complete?
        !tasks.any?{|task| task.completed == false}
    end 

 
end
