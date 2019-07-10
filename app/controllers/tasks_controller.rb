class TasksController < ApplicationController

    def new
        @task = Task.new(list_id: params[:list_id])
        respond_to do |format|
            format.html {redirect_to :new
            format.json {render json: @task}
          end
    end 

    def create 
        @task = Task.create(task_params)
        if @task.save
            respond_to do |format|
                format.html {redirect_to list_task_path(@task.list, @task))
                format.json {render json: @task}
            end
        else
            render 'new' 
        end
    end 

    def show
        @task = Task.find_by(id: params[:id])
        @user_task = @task.users_task.find{|user_task|user_task.user_id == current_user.id}
        respond_to do |format|
            format.html {redirect_to tas_path(@task)
            format.json {render json: @task, @user_task}
          end
    end 

    def edit 
        @task = Task.find_by(id: params[:id])
        respond_to do |format|
            format.html {redirect_to edit_task_path(@task)
            format.json {render json: @task}
          end
    end 

    def update
        @task = Task.find_by(id: params[:id])
        if @task.update(task_params)
            respond_to do |format|
                format.html {redirect_to list_task_path(@task.list, @task)
                format.json {render json: @task}
              end
        else 
            render 'edit'
        end 
    end

    def destroy 
        task = Task.find_by(id: params[:id])
        @list = task.list
        task.destroy
        redirect_to list_path(@list)
    end 

    private 

    def task_params
        params.require(:task).permit(:title, :note, :list_id, :completed, user_ids: [])
    end 
end
