class ListsController < ApplicationController

    def index
        @lists = List.all
    end 

    def new
        @list = List.new
    end 

    def create 
        if list = List.create(list_params)
            redirect_to user_list_path(list)
        else
            redirect_to new_user_list_path
        end 
    end 

    def show
        @list = List.find_by(id: params[:id])
    end 

    def edit
        @list = List.find_by(id: params[:id])
    end 

    def update 
        list = List.find_by(id: params[:id])
        list.update(list_params)
        redirect_to list_path(list)
    end 

    private 

    def list_params
        params.require(:list).permit(:title, :user_id)
    end 
end
