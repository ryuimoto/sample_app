class RelationshpsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @user = User.find(params[:relationships][:folloewed_id])
        current_user.follow!(@user)
        redirect_to @user
    end
    
    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow!(@user)
        redirect_to @user
    end
end
