class Client < ActiveRecord::Base
#  mount_uploader :logo, ClientLogoUploader

  def self.do_order(ids)
    where({ :id => ids }).update_all(
      ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
    )
  end
end
