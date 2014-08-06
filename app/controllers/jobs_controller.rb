class JobsController < ApplicationController

  before_filter :require_login
  def index
    #@jobs = Job.all
    #@jobs = Job.paginate(page: params[:page])
    @jobs=Job.paginate(:page => params[:page], :per_page => 8)
    @current=current_user
  end

 def require_login
  unless signed_in?||csigned_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to signin_path # halts request cycle
  end
end
end
