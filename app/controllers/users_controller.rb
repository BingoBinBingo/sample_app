class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
 
    if @user.save
      #TODO
  		flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      puts "用户注册成功!"
    else
      puts "没注册成功"
      render 'new'
    end
 
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
