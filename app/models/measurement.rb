class Measurement < ActiveRecord::Base
  belongs_to :keg
  attr_accessible :volume, :temperature, :sampled_at
  validates_uniqueness_of :volume, :scope => :keg_id
end
