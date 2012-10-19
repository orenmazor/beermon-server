class CallbackController < ApplicationController
  skip_before_filter :authenticate
  
  def index
    brewery = Manufacturer.find_by_id(params[:brewery])
    if brewery
      response = Twilio::TwiML::Response.new do |r|
        r.Say "Connecting you to #{brewery.name}", :voice => 'woman'
        r.Dial :callerId => brewery.phone
      end

      render :text => response.text, :content_type => "text"
    else
      render :text => "whoopsie"
    end
  end
end
