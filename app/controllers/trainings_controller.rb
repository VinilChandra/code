class TrainingsController < ApplicationController

  before_filter :require_login
 def index

 @trainings = Training.all
 end


def require_login
  unless signed_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to signin_path # halts request cycle
  end
end
end
