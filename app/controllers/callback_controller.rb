class CallbackController < ApplicationController
  skip_before_filter :authenticate

  def create
    Rails.logger.info params
    brewery = Manufacturer.find_by_id(params[:brewery])
    if brewery
      Rails.logger.info "#{brewery.name}"
      response = Twilio::TwiML::Response.new do |r|
        r.Say "Connecting you to #{brewery.name}", :voice => 'woman'
        r.Dial :callerId => brewery.phone
      end

      Rails.logger.info response.text

      render :text => response.text, :content_type => "application/xml"
    else
      render :text => "whoopsie"
    end
  end
end
