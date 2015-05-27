class Admin::UsersController < ApplicationController

  before_filter :restrict_access_admin
  
  def index
    @users = User.all
    # puts "ITs WORKING"
  end

  # def new
  #   @user = User.new
  # end

  # def create

  #   @user = User.new(user_params)

  #   if @user.save
  #     session[:user_id] = @user.id, 
  #     redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
  #   else
  #     render :new
  #   end
  # end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :avatar)
  end
end
