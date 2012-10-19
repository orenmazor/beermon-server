class User < ActiveRecord::Base
  attr_accessible :email, :phone_number, :send_sms, :send_email
  # attr_accessible :title, :body
end
