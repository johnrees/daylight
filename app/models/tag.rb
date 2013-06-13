class Tag < ActiveRecord::Base
  # has_and_belongs_to_many :videos
  has_many :videos
  before_save :update_slug

  def update_slug
    self.slug = name.parameterize
  end
  # extend FriendlyId
  # friendly_id :slug_candidates, use: :scoped, scope: :category
  # def should_generate_new_friendly_id?
  #   true#new_record?
  # end
  def to_s; name end

  def self.do_order(ids)
    where({ :id => ids }).update_all(
      ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
    )
  end

  def slug_candidates
    [
      :name
    ]
  end

  def categories
    [
      Tag.where('category = work'),
      Tag.where('category = light-work')
    ]
  end
end
