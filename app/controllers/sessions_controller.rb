class SessionsController < ApplicationController
     def new
  end
# create a new session when the user logs in
  def create
     @user = User.where(username: params[:session][:username]).first
     if @user and @user.password == params[:session][:password]
     session[:user_id] = @user.id
# redirect to the user's profile page
     flash[:notice] = "You're logged in"
     redirect_to user_path @user
    # or use redirect_to '/users/' + @user.id.to_s
    else
# if it doesn't work, flash noticeand redirect to login
      flash[:notice] = "... something went wrong. Please try again!"
      redirect_to '/'
    end
  end


  def destroy

    if current_user
      session[:user_id] = nil
      flash[:notice] = "Signed out!"
      redirect_to root_path
    end
  end
end
