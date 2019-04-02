class List < ApplicationRecord
    has_many :tasks 
    belongs_to :user

    def self.completed_tasks
        where(list_complete?: true)
    end

    def self.incomplete_tasks
        where(list_complete?: false)
    end

    def list_complete?
        !tasks.any?{|task| task.status == "Incomplete"}
    end 

 
end
