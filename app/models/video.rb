class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def to_s
    name
  end

  def slug_candidates
    [
      :name
    ]
  end
end
