class BeerTap < ActiveRecord::Base
  attr_accessible :name
  has_one :keg

  def serializable_hash(options={})
    options[:include] ||= [:keg]
    super
  end
end
