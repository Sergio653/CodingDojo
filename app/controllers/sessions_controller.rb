class SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(email: params[:user][:email])
    
        if @user
          if @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            return redirect_to groups_path
            
          end
          flash[:errors] = ["Invalid Email/Password"]
          return redirect_to sessions_new_path
        end
        flash[:errors] = ["User Does not Exist"]
        return redirect_to sessions_new_path
      end
    
      def destroy
        session.delete :id
        redirect_to sessions_new_path
      end
end
