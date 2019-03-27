class ListsController < ApplicationController

    def index

    end 

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

    def list_params
        params.require(:list).permit(:title, :user_id)
    end 
end
