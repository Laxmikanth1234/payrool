class SessionsController < ApplicationController
	layout "login"
	
  def new
	end

	def create
	  user = User.authenticate(params[:session][:user_name], params[:session][:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  current_user = nil
    session.destroy
    session = nil
    render "new"
	end
  
end
