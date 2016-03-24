class ProfilesController < ApplicationController
  def new
      # form where a user can fill out their own profile
      @user = User.find( params[:user_id] )
      # rails gives us build_profile method because we established the model associations between the users and profiles (in routes file, profiles is nested under users)
      @profile = @user.build_profile
  end

end