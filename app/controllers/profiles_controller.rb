class ProfilesController < ApplicationController
  def new
      # form where a user can fill out their own profile
      @user = User.find( params[:user_id] )
      # rails gives us build_profile method because we established the model associations between the users and profiles (in routes file, profiles is nested under users)
      @profile = @user.build_profile
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
    
  
  
  private
    # :profile tells Rails which object can be saved to the database 
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
      

end