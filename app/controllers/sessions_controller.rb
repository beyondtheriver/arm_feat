class SessionsController < ApplicationController
  def new

  end
# create a new session when the user logs in
  def create
    session_params = params[:session]
     @user = User.where(username: session_params['username']).first
     puts "USER IS #{@user.inspect}"

     if @user and @user.authenticate(session_params['password'])
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
