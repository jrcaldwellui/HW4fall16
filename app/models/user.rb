class User < ActiveRecord::Base
    
    class << self
        def create_user!(params)
            puts("User id of new user: #{params[:user_id]}")
            if( User.find_by user_id: params[:user_id] )
                return nil
            else
                params[:session_token] = SecureRandom.base64
                User.create!(params) 
            end
            
        end
    end
        
end
