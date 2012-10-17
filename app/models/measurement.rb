class Measurement < ActiveRecord::Base
  belongs_to :keg
  attr_accessible :volume, :temperature, :sampled_at
end
