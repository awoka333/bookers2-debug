class RelationshipsController < ApplicationController
    
    def create
        current_user.follow(params[:id])
        redirect_to request.referer
    end
    
    def destroy
        current_user.unfollow(params[:id])
        redirect_to request.referer
    end
    
    def followed
        @user = User.find(params[:id])
    end
    
    def follower
        @user = User.find(params[:id])
    end
    
end
