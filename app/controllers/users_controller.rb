class UsersController < ApplicationController

    def new 
        @user = User.new
    end 
    
    def create
        @user = User.new(user_params)
        # binding.pry
        if @user.save
            # binding.pry
            session[:user_id] = @user.id
            redirect_to kpopgroups_path(@user)
        else 
            render :new 
        end 
    end 

    def show 
        # binding.pry
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    def destroy
        @user.destroy
        redirect_to root_path
    end


    private 

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :password, :hometown)
    end 
end 