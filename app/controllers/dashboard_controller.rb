class DashboardController < ApplicationController

	def index
		@beers = Beer.all
		@kegs = Keg.all
	end
end
