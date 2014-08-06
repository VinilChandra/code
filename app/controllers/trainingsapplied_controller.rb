class TrainingsappliedController < ApplicationController
def index
	@trainings=Training.where(name: current_recruiter.companyname)
  end
end
