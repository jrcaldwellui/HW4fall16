class UsersController < ApplicationController
    
  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to movies_path
    #this will create new user and check for duplicate user id
  end
  
end