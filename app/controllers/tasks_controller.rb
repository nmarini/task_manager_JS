class TasksController < ApplicationController

    def new
        @task = Task.new
        @list = List.find_by(id: params[:id])
    end 

    def create 
        if task = Task.create(task_params)
            redirect_to list_task_path(task.list, task)
        else
            list = List.find_by(id: params[:id])
            redirect_to new_list_task_path(list) 
        end
    end 

    def show
        @task = Task.find_by(id: params[:id])
    end 

    def edit 
        @task = Task.find_by(id: params[:id])
    end 

    def update
        task = Task.find_by(id: params[:id])
        task.update(task_params)
        redirect_to list_task_path(task.list, task)
    end

    def destroy 
        task = Task.find_by(id: params[:id])
        task.destroy
    end 

    private 

    def task_params
        params.require(:task).permit(:title, :note, :list_id, :completed)
    end 
end
