class BeerTap < ActiveRecord::Base
  attr_accessible :name
  has_one :keg

  def detached?
    keg.blank?
  end

  def serializable_hash(options={})
    options[:include] ||= [:keg]
    super
  end
end
