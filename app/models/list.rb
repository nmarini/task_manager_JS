class List < ApplicationRecord
    validates :title, presence: true

    has_many :tasks 
    belongs_to :user
    
    def list_complete?
        !tasks.any?{|task| task.status == "Incomplete"}
    end 
 
 
end
