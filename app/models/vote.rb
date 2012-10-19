class Vote < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  attr_accessible :value
end
