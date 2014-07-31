class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @current=current_user
  end

end
