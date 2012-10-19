class DashboardController < ApplicationController

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
	end

  def call
    brewery = Manufacturer.find_by_id(params[:manufacturer_id])
    if brewery
      twilio = Twilio::REST::Client.new($twilio_username, $twilio_password)
      from = $twilio_sender
      to = brewery.phone
      url = Beermon::Application.application_url + "/callback?to=#{current_user.phone_number}"

      flash[:message] = "Setting up a call to #{brewery.name}"

      Thread.new do
        twilio.client.calls.create({:from => from, :to => to, :url => current_user.})
      end
      redirect_to root_url
    else
      flash[:error] = "That brewery doesn't exist???!?"
    end
    redirect_to root_url
  end
end
