class DashboardController < ApplicationController
  skip_before_filter :authenticate
  before_filter :ensure_logged_in

	def index
    @beer_taps = BeerTap.all
		@beers = Beer.all
	end

  def call
    brewery = Manufacturer.find_by_id(params[:manufacturer_id])
    if brewery
      twilio = Twilio::REST::Client.new($twilio_username, $twilio_password)
      from = $twilio_sender
      to = current_user.phone_number

      url = Beermon::Application.application_url + "/callback?phone=#{brewery.phone}"

      flash[:message] = "Setting up a call with #{brewery.name}"

      if Rails.env.production?
        Thread.new do
          call = twilio.account.calls.create({:from => from, :to => to, :url => url})
        end
      else
        flash[:message] << "You are in development fool! No real calls"
      end
    else
      flash[:error] = "That brewery doesn't exist???!?"
    end
    redirect_to root_url
  end

  private

  def ensure_logged_in
    unless current_user.present?
      redirect_to login_url
    end
  end
end
