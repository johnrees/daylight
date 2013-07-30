class HomepageVideo < ActiveRecord::Base
  validates_presence_of :name
  def to_s
    name || "untitled"
  end
end
