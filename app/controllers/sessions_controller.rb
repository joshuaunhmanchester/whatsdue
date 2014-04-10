class SessionsController < ApplicationController

  def new
  end
  
  # Attempts to login a user with the given credentials (email and password).
  # If successful, will set our :user_id session.
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :controller => 'dashboard', :action => 'index'
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  # Logs out a user by deleting the :user_id session.
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
