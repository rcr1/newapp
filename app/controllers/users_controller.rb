class UsersController < ApplicationController
  before_action :authenticate_user!

    def show
      if current_user
        @user = User.find( params[:id] ) 
      else
        redirect_to root_path
        flash[:danger] = "You must be signed in to view user profiles."
      end
    end
    
  def index
    @users = User.all 
  end
  
end