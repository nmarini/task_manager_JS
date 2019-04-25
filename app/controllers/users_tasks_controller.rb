class UsersTasksController < ApplicationController
    def update
        @user_task = UsersTask.find_by(id: params[:id])
        
        if @user_task.update(users_task_params)
            redirect_to request.referrer
        else 
            render request.referrer
        end        

    end 

    private 

    def users_task_params
        params.require(:users_task).permit(:accepted, :user_id, :task_id)
    end 
end
