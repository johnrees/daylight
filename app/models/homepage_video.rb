class HomepageVideo < ActiveRecord::Base
  validates_presence_of :name
  def to_s
    name || "untitled"
  end

  def self.do_order(ids)
    where({ :id => ids }).update_all(
      ["ordinal = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"]
    )
  end

end
