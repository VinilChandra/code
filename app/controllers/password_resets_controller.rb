class PasswordResetsController < ApplicationController

    #before_filter :require_login
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
    user.send_password_reset if user
     flash[:notice] = "Email sent with password reset instructions."
    redirect_to root_url
  else
    flash[:notice]="Enter valid email"
    render :new
  end
end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end
  private
   def require_login
  unless signed_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to signin_path # halts request cycle
  end
end
end
