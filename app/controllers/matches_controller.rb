class MatchesController < ApplicationController

    def index 
        @matches = Match.all
        # binding.pry

    end 

    def show 
        @match = Match.find_by_id(params[:id])
    end 
    
end
