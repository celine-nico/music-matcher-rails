class KpopgroupsController < ApplicationController

    def index
        if logged_in?
            if params[:user_id]
                @user = User.find_by_id(params[:user_id])
                @kpopgroups = Kpopgroup.all 
                # binding.pry
            else 
                @kpopgroups = Kpopgroup.all
                # binding.pry
            end 
        end
    end


    def show
        if logged_in?
            @kpopgroup = Kpopgroup.find_by_id(params[:id])
        end 
    end 


    private 

    def kpopgroup_params
        params.require(:kpopgroup).permit(:name, :members, :label, :group_type)
    end 
    
end
