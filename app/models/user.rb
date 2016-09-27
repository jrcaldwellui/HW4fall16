class User < ActiveRecord::Base
    
    class << self
        def create_user!(params)
            puts("User id of new user: #{params[:user_id]}")
            if( User.find_by user_id: params[:user_id] )
                return nil
            else
                #params[:session_token] = SecureRandom.base64
                User.create!(params) 
            end
        end
        
        def login_user(uri_params)
            login_params uri_params.permit(:user_id,:email)
            user = User.find_by user_id: params[:user_id] 
            
            if(user && user.email == login_params[:email])
                user.session_token = SecureRandom.base64
            else
                return nil
            end
                
        end
    end
        
end
