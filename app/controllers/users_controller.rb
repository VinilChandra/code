class UsersController < ApplicationController

def new
@user = User.new
end

def create
 @user = User.new(user_params)

 if simple_captcha_valid?

    if @user.save
        flash[:notice] = "You have successfully registered "
          redirect_to signin_path

        else
               render 'new'
      end
    else

        flash[:notice] = "captcha did not match"
      render 'new'
    end
end

def show
    @user=User.find(params[:id])
  end






private


    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:phone,:address,:state,:dist,:citytown,:mandal,:birth)
    end
    # Before filters

    def signed_in_user

    end

    def correct_user

    end



end

