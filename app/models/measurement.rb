class Measurement < ActiveRecord::Base
  belongs_to :keg
  attr_accessible :amount
end
