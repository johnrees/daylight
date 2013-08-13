class Client < ActiveRecord::Base
 mount_uploader :logo, ClientLogoUploader
 belongs_to :video

 validates_presence_of :name

  def self.do_order(ids)
    where({ :id => ids }).update_all(
      ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
    )
  end
end
