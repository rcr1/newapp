class ProfilesController < ApplicationController
  # has Devise authenticate all user actions before any of the following methods in this controller file
  before_action :authenticate_user!
  before_action :only_current_user
  
  def new
      # form where a user can fill out their own profile
      @user = User.find( params[:user_id] )
      # rails gives us build_profile method because we established the model associations between the users and profiles (in routes file, profiles is nested under users)
      @profile = Profile.new
  end
  
  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    
    if @profile.save
      flash[:success] = 'Profile saved!'
      redirect_to user_path( params[:user_id] )
    else
      flash[:danger] = 'Error. Profile has not been created.'
      render action: :new
    end
  end
    
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile  = current_user.profile
    if @profile.update(profile_params) 
      flash[:success] = 'Profile saved!'
      redirect_to user_path( params[:user_id] )
    else
      flash[:danger] = 'Error. Profile has not been updated.'
      render action: :edit
    end
  end
  
  private
    # :profile tells Rails which object can be saved to the database 
    def profile_params
      params.require(:profile).permit(:avatar, :first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
end
