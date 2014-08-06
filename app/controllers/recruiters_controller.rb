class RecruitersController < ApplicationController
def new
@recruiter = Recruiter.new
end

def create
 @recruiter = Recruiter.new(recruiter_params)

 if simple_captcha_valid?

    if @recruiter.save
        flash[:notice] = "You have successfully registered "
          redirect_to recruitersignin_path

        else
               render 'new'
      end
    else

        flash[:notice] = "captcha did not match"
      render 'new'
    end
end

def show
    @recruiter=Recruiter.find(params[:id])
  end






private


    def recruiter_params
      params.require(:recruiter).permit(:name, :email, :password,
                                   :password_confirmation,:phone,:companyaddr,:companyname)
    end

end
