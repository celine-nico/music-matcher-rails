class ApplicationController < ActionController::Base




    private 

    def logged_in?
        !current_user.nil?
    end

    def current_user
        @user = User.find_by_id(session[:user_id])
    end 
end
