class MatchesController < ApplicationController

    def index 
        @matches = Match.all
        # binding.pry
    end 

    def new
        if params[:user_id]

            find_user
            @match = @user.matches.build
        else 
            flash[:message] = "Please log in before you can make a match!"
            redirect_to login_path
        end 

    end 

    def create 
        if params[:user_id] 
            find_user
        else 
            flash[:message] = "Please log in before you can make a match!"
            redirect_to login_path
        end 
        # binding.pry
        if Kpopgroup.match_with_genre(params[:match][:genre]).size > 0
            @group_match = Kpopgroup.match_with_genre(params[:match][:genre]).sample
            @match = @user.matches.build(match_params)
            @match.kpopgroup_id = @group_match.id   
            # binding.pry
        else 
            flash[:message] = "Dang! There is no group in the library to match you with. Create a new group or try again!"
            render :new
        end 
        # binding.pry
        if @match.save 
            # binding.pry
            redirect_to user_match_path(@user, @match)
        else
            flash[:message] = "Something went wrong. Try again!"
            render :new
        end
        # binding.pry
    end 

    def show 
        @match = Match.find_by_id(params[:id])
        @kpopgroup = Kpopgroup.find_by_id(@match.kpopgroup_id)
    end 

    private 

    def find_user
        @user = User.find_by_id(params[:user_id])
    end

    def match_params
        params.require(:match).permit(:user_id, :kpopgroup_id, :concept)
    end 

end
