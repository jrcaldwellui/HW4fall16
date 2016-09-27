class SessionsController < ApplicationController
    def session_params
        params.require(:user).permit(:user_id,:email)
    end

   def new
       #display login page
   end
   
   def create
        user = User.login_user(session_params)
        if (user)
            session[:session_token] = user.session_token
            flash[:notice] = "You are logged in as #{user.user_id}"
            redirect_to movies_path
        else
            flash[:notice] = 'Invalid user-id/email combination'
            redirect_to login_path
        end
            
   end
   
   def destroy
        user = session_params[:user]
        user.session = nil
        user.save()
        redirect_to movies_path
   end
   
    
end