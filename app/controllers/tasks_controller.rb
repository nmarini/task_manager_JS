class TasksController < ApplicationController

    def new

    end 

    def create 

    end 

    def show

    end 

    def edit 

    end 

    def update

    end

    private 

    def task_params
        params.require(:task).permit(:title, :note, :list_id, :completed)
    end 
end
