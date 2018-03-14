class UsersController < ApplicationController
  def new
  @user=User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to home_path, :notice =>"Signed Up!"
  else
    render "new", :notice =>"Please check that your username and/or email is correct"
  end
end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :email)
end

end
