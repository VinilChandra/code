class RsessionsController < ApplicationController
def new

  end

  def create
     recruiter = Recruiter.find_by(email: params[:session][:email].downcase)

    if recruiter && recruiter.authenticate(params[:session][:password])
      sign_in recruiter

      redirect_to  jobs_path
    else

      flash[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    sign_out
    redirect_to root_url
  end
    # Before filters

end
