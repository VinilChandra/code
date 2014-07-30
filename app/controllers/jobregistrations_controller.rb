class JobregistrationsController < ApplicationController
    def show
          # binding.pry
          @current = current_user
        @jobs=Jobregistration.new
    end

    def create


        @job = Jobregistration.new(user_params)

        if @job.save

            # # @job.userjobs <<

              jobid =  params[:jobregistration][:hiddenid].to_i

            Userjob.create(user_id: current_user.id, jobregistration_id: jobid)

           flash[:notice] = "You have successfully applied for the job"
            redirect_to jobs_path

        else
            flash[:notice] = "Sorry!! You have not registered "
             render 'show'
      end
    end

end
private
    def user_params
      params.require(:jobregistration).permit(:name, :age,:housenumber,:hiddenid,:attachment,:street,:village,:district,:state,:phone,:email,:experience,:qualification,:school1,:school2,:school3,:school4,:passout1,:passout2,:passout3,:passout4,:standard1,:standard2,:standard3,:standard4,:job1,:job2,:job3,:exp1,:exp2,:exp3,:desc,:languages,:choicelocation,:previoussalary,:expectedsalary,:religion,:caste)
          end
