class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], [:phone_number])

    if user
      session[:user_id] = user.id
      redirect_to 'pages/home', :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or email!"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
