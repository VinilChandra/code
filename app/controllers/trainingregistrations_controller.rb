class TrainingregistrationsController < ApplicationController


  before_filter :require_login
  def show
   # binding.pry
   @current = current_user
   @trainings=Trainingregistration.new
  end

    def create
     @training = Trainingregistration.new(user_params)

      if @training.save
        trainingid =  params[:trainingregistration][:hiddenid].to_i
       Usertraining.create(user_id: current_user.id, trainingregistration_id: trainingid)
       flash[:notice] = "You have successfully applied for the job"
       redirect_to trainings_path
      else
       flash[:notice] = "Sorry!! You have not registered "
       render 'show'
      end
    end

   private

  def user_params
    params.require(:trainingregistration).permit(:name, :age,:housenumber,:hiddenid,:attachment,:street,:village,:district,:state,:phone,:email,:experience,:qualification,:school1,:school2,:school3,:school4,:passout1,:passout2,:passout3,:passout4,:standard1,:standard2,:standard3,:standard4,:job1,:job2,:job3,:exp1,:exp2,:exp3,:desc,:languages,:choicelocation,:previoussalary,:expectedsalary,:religion,:caste)
  end

 def require_login
  unless signed_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to signin_path # halts request cycle
  end
end

end