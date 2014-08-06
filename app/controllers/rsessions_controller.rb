class RsessionsController < ApplicationController


 def new

  end

  def create
     recruiter = Recruiter.find_by(email: params[:session][:email].downcase)
    
    if recruiter && recruiter.authenticate(params[:session][:password])
      csign_in recruiter

       # p recruiter.companyname
      redirect_to  "/jobsapplied"
    else

      flash[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    csign_out
    redirect_to root_url
  end
    # Before filters

end
