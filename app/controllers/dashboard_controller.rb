class DashboardController < ApplicationController

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
	end
end
