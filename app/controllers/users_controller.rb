class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id,:email)
  end
    
  def new
    # default: render 'new' template
  end

  def create
    @user = User.create()
    @user.email = user_params[:email]
    @user.user_id = user_params[:user_id]
    puts(@user)
    @user.save
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to movies_path
    #this will create new user and check for duplicate user id
  end
  
end