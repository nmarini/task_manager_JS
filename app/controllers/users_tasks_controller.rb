class UsersTasksController < ApplicationController
    def update 
        @user_task = UsersTask.find_by(id: params[:users_task][:accepted])
        if @user_task.update(users_task_params)
            redirect_to user_path(@user_task.user_id)
        else
            redirect_to user_path(@user_task.user_id)
        end 

    end 

    private 

    def users_task_params
        params.require(:users_task).permit(:accepted, :user_id, :task_id)
    end 
end
