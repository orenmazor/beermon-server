class DashboardController < ApplicationController

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
	end

  def call
    brewery = Manufacturer.find_by_id(params[:manufacturer_id])
    if brewery
    else
      flash[:error] = "That brewery doesn't exist???!?"
    end
    redirect_to root_url
  end
end
