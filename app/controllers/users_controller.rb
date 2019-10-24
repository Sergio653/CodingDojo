class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.valid?
      flash[:success] = "User has been created. Please log in"
        redirect_to sessions_new_path
    else  
      flash[:errors] = @user.errors.full_messages
      redirect_to sessions_new_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
