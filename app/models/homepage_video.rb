class HomepageVideo < ActiveRecord::Base
  validates_presence_of :name
  mount_uploader :image, HomepageImageUploader
  mount_uploader :video, HomepageVideoUploader

  def self.do_order(ids)
    where({ :id => ids }).update_all(
      ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
    )
  end

  def to_s
    name || "untitled"
  end

  def webm
    "http://daylightcdn.s3.amazonaws.com/homepage_videos/#{id}/video.webm"
  end

  def mp4
    "http://daylightcdn.s3.amazonaws.com/homepage_videos/#{id}/video.mp4"
  end

  def jpg
    "http://daylightcdn.s3.amazonaws.com/homepage_videos/#{id}/screenshot_0.jpg"
  end

  def self.do_order(ids, tag_id = nil)
    if tag_id.to_i == 0
      where({ :id => ids }).update_all(
        ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
      )
    else
      where({ :id => ids }).update_all(
        ["ordinal = NULL", ",#{ids.join(',')},"]
      )
    end
  end

  def self.active
    where('ordinal >= 0').order('ordinal ASC')
  end

  def self.inactive
    all - where('ordinal >= 0').order('ordinal ASC')
  end

end
