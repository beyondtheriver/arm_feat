class UsersController < ApplicationController
   def index
      @users = User.all
   end

   def new
      @user = User.new
   end

   def create
      @user = User.create(user_params)

      if @user.save
         @attempt = Attempt.create(user_id: @user.id)
         session[:user_id] = @user.id
         redirect_to user_path(@user.id)
      else
         redirect_to new_user_path
      end
   end

   def show
      @user = User.find(params[:id])
      @current_user = User.find(session[:user_id])
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
    params.require(:user).permit(:username, :password, :email, :avatar)
   end
end

