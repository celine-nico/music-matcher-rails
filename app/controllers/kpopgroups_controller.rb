class KpopgroupsController < ApplicationController

    def index
        if logged_in?
            @user = User.find_by_id(params[:user_id])
            @kpopgroups = Kpopgroup.search(params[:search])
            # binding.pry
        else 
            @kpopgroups = Kpopgroup.search(params[:search])
        end
    end


    def show
        if logged_in?
            @kpopgroup = Kpopgroup.find_by_id(params[:id])
        end 
    end 


    private 

    def kpopgroup_params
        params.require(:kpopgroup).permit(:name, :members, :label, :group_type, :search)
    end 
    
end
