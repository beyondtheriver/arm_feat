class UsersController < ApplicationController
   def index
      @users = User.all
   end

   def new
      @user = User.new
   end

   def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
   end

   def show
      @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])
   end

   def destroy
      @user = User.find(params[:id])
      @user.destroy
      session[:user_id] = nil

      redirect_to root
   end

   private

   def user_params
    params.require(:user).permit(:username, :password, :email)
   end
end

