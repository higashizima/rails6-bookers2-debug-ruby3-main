class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    follower = current_user.relationships.new(followed_id: params[:user_id])
    follower.save
    redirect_back fallback_location:root_path
  end
  
  def destroy
    follower = current_user.relationships.find_by(followed_id: params[:user_id])
    follower.destroy
    redirect_back fallback_location:root_path
  end
  
  
end
