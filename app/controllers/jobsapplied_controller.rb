class JobsappliedController < ApplicationController

def index
	
   
	@jobs=Job.where(name: current_recruiter.companyname)
     
     
  end
end
