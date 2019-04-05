class ListsController < ApplicationController

    def index
        @lists = List.all
    end 

    def new
        @list = List.new(user_id: current_user.id)
        
    end 

    def create 
        @list = List.create(list_params)
        if @list.save
            redirect_to user_list_path(current_user, @list)
        else
            render 'new'
        end 
    end 

    def show
        @list = List.find_by(id: params[:id])
    end 

    def edit
        @list = List.find_by(id: params[:id])
    end 

    def update 
        @list = List.find_by(id: params[:id])
    
        if @list.update(list_params)
            redirect_to list_path(@list)
        else 
            render 'edit'
        end 
    end 

    def destroy 
        list = List.find_by(id: params[:id])
        list.destroy
        redirect_to user_path(current_user)
    end 

    private 

    def list_params
        params.require(:list).permit(:title, :user_id)
    end 
end
