class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user
    
    def logged_in?
        !current_user.nil?
    end



    private 


    def current_user
        @user = User.find_by_id(session[:user_id])
    end 
end
