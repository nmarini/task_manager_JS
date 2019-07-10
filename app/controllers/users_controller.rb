class UsersController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new,:create] 
    
    def new 
        @user = User.new
    end 

    def create
        @user = User.create(user_params)

        if @user.save
            session[:user_id] = @user.id 
            session_login(@user)
        else
            render 'new'
        end 
    end 

    def show
        @user = User.find_by_id(params[:id])
        @unaccepted_user_tasks = UsersTask.unaccepted_by_user(@user)
        respond_to do |format|
            format.html {redirect_to user_path(@user)}
            format.json {render json: @user, @unaccepted_user_tasks}
          end
    end

    def edit 
        @user = User.find_by_id(params[:id])
    end 
    
    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            respond_to do |format|
                format.html {redirect_to user_path(@user)}
                format.json {render json: @user}
            end
        else 
            render 'edit'
        end 
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation, task_ids: [])
    end 
end
