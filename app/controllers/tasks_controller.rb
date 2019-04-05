class TasksController < ApplicationController

    def new
        @task = Task.new(list_id: params[:list_id])
    end 

    def create 
        @task = Task.create(task_params)
        if @task.save
            redirect_to list_task_path(task.list, task)
        else
            @list = List.find_by(id: params[:task][:list_id])
            render 'new' 
        end
    end 

    def show
        @task = Task.find_by(id: params[:id])
        @users_task = @task.users_task.find{|user_task|user_task.user_id == current_user.id}
    end 

    def edit 
        @task = Task.find_by(id: params[:id])
    end 

    def update
        @task = Task.find_by(id: params[:id])
        if @task.update(task_params)
            redirect_to list_task_path(@task.list, @task)
        else 
            render 'edit'
        end 
    end

    def destroy 
        task = Task.find_by(id: params[:id])
        task.destroy
        redirect_to user_path(current_user)
    end 

    private 

    def task_params
        params.require(:task).permit(:title, :note, :list_id, :completed, user_ids: [])
    end 
end
