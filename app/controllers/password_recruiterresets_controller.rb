class PasswordRecruiterresetsController < ApplicationController

    #before_filter :require_login
  def new
  end

  def create
    recruiter = Recruiter.find_by_email(params[:email])
    if recruiter
    recruiter.send_recruiterpassword_reset if recruiter
     flash[:notice] = "Email sent with password reset instructions."
    redirect_to root_url
  else
    flash[:notice]="Enter valid email"
    render :new
  end
end

  def edit
    @recruiter = Recruiter.find_by_password_recruiterreset_token!(params[:id])
  end

  def update
    @recruiter = Recruiter.find_by_password_recruiterreset_token!(params[:id])
    if @recruiter.password_recruiterreset_sent_at < 2.hours.ago
      redirect_to new_password_recruiterreset_path, :alert => "Password reset has expired."
    elsif @recruiter.update_attributes(params.require(:recruiter).permit(:password, :password_confirmation))
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end
  private
   def require_login
  unless csigned_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to '/recruitersignin' # halts request cycle
  end
end
end
