class TrainingsController < ApplicationController

  before_filter :require_login
 def index
@trainings=Training.paginate(:page => params[:page], :per_page => 5)
    @current=current_user
 end


def require_login
  unless signed_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to signin_path # halts request cycle
  end
end
end
