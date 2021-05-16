class KpopgroupsController < ApplicationController

    def index
        if logged_in?
            @user = User.find_by_id(params[:user_id])
            @kpopgroups = Kpopgroup.all
            # binding.pry
        end
    end

    def new 
        if logged_in?
            @kpopgroup = Kpopgroup.all
        end 
    end 

    def show
        if logged_in?
            @kpopgroup = Kpopgroup.find_by_id(params[:id])
        end 
    end 

    def edit 
        if logged_in?
            @kpopgroup = Kpopgroup.all
        end 
    end 

    def destroy
        @kpopgroup.destroy
        redirect_to kpopgroups_path
    end



    private 

    def kpopgroup_params
        params.require(:kpopgroup).permit(:name, :members, :label, :group_type)
    end 
    
end
