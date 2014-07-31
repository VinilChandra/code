class FuturejobsController < ApplicationController
	def index
    @future = Futurejob.all
  end
end
