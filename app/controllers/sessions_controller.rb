class SessionsController < ApplicationController
skip_before_filter :authorize

  def new
  end

  def create

    
   if user = User.authenticate(params[:name], params[:password])
session[:user_id] = user.id
if session[:user_id] == 28
redirect_to admin_url, :notice => "Logged in"
else
  
redirect_to store_url
end
else
    flash[:notice]="invalid username password"
  render :new 

end

  end

  def destroy
    session[:user_id] = nil
   redirect_to store_url, :notice => "Logged out"

  end

end
