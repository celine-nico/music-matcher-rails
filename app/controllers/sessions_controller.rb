class SessionsController < ApplicationController
    
    def home
    end 

    def omniauth #logging user in 
    end 

    def new             
        
    end

    def create
  
      @user = User.find_by(username: params[:username])
  
    #   binding.pry
  
      if  @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            # binding.pry  
          redirect_to user_kpopgroups_path(@user)
      else
          redirect_to login_path        
      end
  
    end

    def login
    end

    def destroy
  
        session.clear
  
        redirect_to root_path    
  
    end
end 