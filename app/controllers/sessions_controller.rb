class SessionsController < ApplicationController
    
    def home
    end 

    def omniauth  
      user = User.create_from_omniauth(auth)
      # binding.pry
      if user.valid?
        session[:user_id] = user.id
        redirect_to user_kpopgroups_path(user)
      else
        flash[:message] = user.errors.full_messages.join(", ")
        redirect_to login_path
      end
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
        flash[:message] = "Invalid Username or Password."
          redirect_to login_path        
      end
  
    end

    def login
    end

    def destroy
  
        session.clear
  
        redirect_to root_path    
  
    end

    private 

    def auth 
      request.env['omniauth.auth']
    end 
end 