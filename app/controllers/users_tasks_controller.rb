class UsersTasksController < ApplicationController
    def update 
        users_task = UsersTask.find_by(id: params[:task][:users_task_id])
        if @task.users_task.update(users_task_params)
            render list_task_path(@task.list, @task)
        else
            redirect_to list_task_path(@task.list, @task)
        end 

    end 

    private 

    def users_task_params
        params.require(:users_task).permit(:accepted, :user_id, :task_id)
    end 
end
