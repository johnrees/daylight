class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  # has_and_belongs_to_many :tags
  belongs_to :tag
  before_save :set_tag_id
  has_many :featured_videos
  has_many :clients


  # def should_generate_new_friendly_id?
  #   true#new_record?
  # end

  def self.tagged
    joins(:tag).where("tags.category <>''")
  end

  def self.featured
    where('featured_ordinal > 0').order('featured_ordinal ASC').limit(3)
  end

  def self.unfeatured
    all - where('featured_ordinal > 0').order('featured_ordinal ASC').limit(3)
  end

  def showreel?
    name.downcase == 'showreel'
  end

  def fullpath
    "/#{tag.category.gsub('_','-')}/#{tag.slug}/#{slug}"
  end

  def fullurl
    "http://www.day-light.co.uk#{fullpath}"
  end

  def feature
    featured?
  end

  def feature=(featured)
    if featured
      FeaturedVideo.create(video: self)
    end
  end

  def featured?
    if FeaturedVideo.count > 0
      FeaturedVideo.last.video == self
    end
  end

  def set_tag_id
    self.tag_id = 0 if tag_id.blank?
  end

  def self.do_order(ids, tag_id = nil, featured_id = nil)
    if tag_id
      where({ :id => ids }).update_all(
        ["tag_id = ?, tag_ordinal = STRPOS(?, ','||id||',')", tag_id, ",#{ids.join(',')},"]
      )
    elsif featured_id == 0
      where({ :id => ids }).update_all(
        ["featured_ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
      )
    elsif featured_id == 1
      where({ :id => ids }).update_all(
        ["featured_ordinal = NULL", ",#{ids.join(',')},"]
      )
    else
      where({ :id => ids }).update_all(
        ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
      )
    end
  end

  def self.uncategorized
    where('tag_id < 1 OR tag_id is NULL')
  end

  def to_s
    name
  end

  def slug_candidates
    [
      :name
    ]
  end
end
