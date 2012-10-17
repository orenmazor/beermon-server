class BeerTap < ActiveRecord::Base
  has_one :keg

  def keg_id
    keg ? keg.id : nil
  end

  def serializable_hash(options={})
    options[:only] ||= [:id, :created_at, :updated_at, :name]
    options[:methods] ||= [:keg_id]
    super
  end
end
