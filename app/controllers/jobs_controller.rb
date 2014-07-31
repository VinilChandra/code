class JobsController < ApplicationController
  def index
    #@jobs = Job.all
    #@jobs = Job.paginate(page: params[:page])
    @jobs=Job.paginate(:page => params[:page], :per_page => 8)
    @current=current_user
  end

end
